# @executor: 掉落物实体
# >作用：使物品掉落物实体的selector标签的值变成下一个玩家的GUUID，同时更新指南针

# 以丢弃者为执行者执行函数
execute unless data entity @s Item.components."minecraft:custom_data"."mh:tracker".selector \
    on origin run function mh:compass/select/initial
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s Item.components."minecraft:custom_data"."mh:tracker".selector
execute if items entity @s contents compass \
    on origin run function mh:compass/select/scroll with storage mh:temp in

# 找到新目标，更改selector标签
execute if items entity @s contents compass run \
    data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".selector set from storage gu:main out

# 调用更新函数
data modify storage mh:temp in.guuid set from entity @s Item.components."minecraft:custom_data"."mh:tracker".selector
data modify storage mh:temp in.slot set value "contents"
data modify storage mh:temp in.dimension set from entity @s Dimension
# 设置mh:temp的trackableCount，若可为2以上则物品修饰器copy_data_and_lore会显示额外信息
execute on origin run function mh:compass/util/filter_my_trackable
execute store result storage mh:temp trackableCount int 1 if entity @a[tag=mh.trackable]
tag @a remove mh.trackable
function mh:compass/update/private/update_cmd_template with storage mh:temp in
