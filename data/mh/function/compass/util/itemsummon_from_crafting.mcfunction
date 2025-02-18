# @executor: 刚召唤的物品掉落物
#> 让掉落物变成玩家刚合成时消耗的追踪器的复制，并变成书与笔
# data merge entity @s {Item:{id:"compass", count:1b},Age:4000s,PickupDelay:0,Tags:["mh.item.pick"]}
data modify entity @s Thrower set from entity @p[tag=this] UUID
data modify entity @s Owner set from entity @s Thrower
# 清除ui物品
execute on origin store result score #result mh.temp store result score #ui_item_count mh.temp run clear @s *[custom_data~{"mhUI":true}]
# 玩家可能丢出ui物品
execute if score #result mh.temp matches 0 store result score #ui_item_count mh.temp run data get entity @n[type=item,distance=..5,nbt={Item:{components:{"minecraft:custom_data":{"mhUI":true}}}}] Item.count
# execute if score #result mh.temp matches 0 run kill @e[type=item,distance=..5,nbt={Item:{components:{"minecraft:custom_data":{"mhUI":true}}}}]

# 如果玩家背包合成格没物品,分以下两种情况返回
#  (合成时用的不是追踪器,则按ui物品的数量退回原版mc指南针)
execute unless items entity @p[tag=this,tag=mh.craft.tracker] player.crafting.* compass run \
    return run execute store result entity @s Item.count byte 1 run scoreboard players get #ui_item_count mh.temp
#  (合成时用的是追踪器,但由于玩家并非在背包合成编辑模式,杀死本掉落物)
execute unless items entity @p[tag=this,tag=mh.craft.tracker] player.crafting.* compass run \
    return run kill @s


# 从玩家背包合成格复制物品
execute if items entity @p[tag=this] player.crafting.0 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.0
execute if items entity @p[tag=this] player.crafting.1 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.1
execute if items entity @p[tag=this] player.crafting.2 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.2
execute if items entity @p[tag=this] player.crafting.3 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.3

# 如果是追踪器 变成书与笔
execute if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    item modify entity @s contents [ \
        {function:"set_name", name: [{"text":"追踪器","color":"white","italic": false},{"text":" (编辑模式)","color":"gray","italic": false}]}, \
        {function:"set_lore", lore: [{text: "在书中输入你想追踪的玩家id",color:"gray",italic:false},{text:""},{text:"丢弃变回指南针",color:"gray",italic:false}], mode: "replace_all"}, \
        {function:"set_item", item: "writable_book"}, \
        {function:"reference", name: "mh:make_unusable"} \
    ]
