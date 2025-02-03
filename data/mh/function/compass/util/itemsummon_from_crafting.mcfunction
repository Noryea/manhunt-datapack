# @executor: 刚召唤的物品掉落物
# data merge entity @s {Item:{id:"compass", count:1b},Age:4000s,PickupDelay:0,Tags:["mh.item.pick"]}
data modify entity @s Thrower set from entity @p[tag=this] UUID
data modify entity @s Owner set from entity @p[tag=this] UUID
execute if items entity @p[tag=this] player.crafting.0 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.0
execute if items entity @p[tag=this] player.crafting.1 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.1
execute if items entity @p[tag=this] player.crafting.2 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.2
execute if items entity @p[tag=this] player.crafting.3 compass run item replace entity @s contents from entity @p[tag=this] player.crafting.3
# 如果是追踪器，且trackableCount大于等于2，则变成书与笔
execute on origin run function mh:compass/util/filter_my_trackable
execute store result storage mh:temp trackableCount int 1 if entity @a[tag=mh.trackable]
tag @a remove mh.trackable
# 变成书与笔
execute if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] if predicate {condition:"value_check",value:{type:"storage",storage:"mh:temp",path:"trackableCount"},range:{min:2}} run \
    item modify entity @s contents [ \
        {function:"set_name", name: {"text":"请输入追踪目标名称","color":"white","italic": true}}, \
        {function:"set_lore", lore: [{text:"丢弃可退出编辑模式",color:"gray",italic:false}], mode: "replace_all"}, \
        {function:"set_item", item: "writable_book"} \
    ] 

# 清除ui物品
execute on origin store result score #ui_item_count mh.temp run clear @s *[custom_data~{"mhUI":true}]

# 防止工作台吞指南针
execute unless items entity @p[tag=this] player.crafting.* compass \
    store result entity @s Item.count byte 1 run scoreboard players get #ui_item_count mh.temp