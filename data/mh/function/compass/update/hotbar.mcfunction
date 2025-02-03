execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

# 设置mh:temp的trackableCount，若可为2以上则物品修饰器copy_data_and_lore会显示额外信息
function mh:compass/util/filter_my_trackable
execute store result storage mh:temp trackableCount int 1 if entity @a[tag=mh.trackable]
tag @a remove mh.trackable
    
# 设置inv为Inventory的复制
data modify storage mh:temp inv set value []
data modify storage mh:temp inv append from entity @s Inventory[{id: "minecraft:compass", components:{"minecraft:custom_data":{"mh:tracker":{}}}}]

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# foreach_hotbar
function mh:compass/update/private/inv_foreach_hotbar

# 删除inv的剩余元素
data remove storage mh:temp inv

# 同时更新副手
function mh:compass/update/weapon_offhand