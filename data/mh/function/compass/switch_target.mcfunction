# @executor: 掉落物实体
# >作用：使物品掉落物实体的selector标签的值变成下一个玩家的GUUID，同时更新指南针

# remove "out" nbt
data remove storage gu:main out

# 以丢弃者为执行者执行函数
execute unless data entity @s Item.components."minecraft:custom_data"."mh:tracker".selector \
    on origin run function mh:compass/select/reset

data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s Item.components."minecraft:custom_data"."mh:tracker".selector

execute if data storage mh:temp in.guuid \
    on origin run function mh:compass/select/scroll with storage mh:temp in

# 找到新目标，更改selector标签
data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".selector set from storage gu:main out
data modify storage mh:temp in.guuid set from storage gu:main out

# 调用更新函数
data modify storage mh:temp in.slot set value "contents"
data remove storage mh:temp in.dimension
execute on origin run data modify storage mh:temp in.dimension set from entity @s Dimension

function mh:compass/update/update_cmd_template with storage mh:temp in
