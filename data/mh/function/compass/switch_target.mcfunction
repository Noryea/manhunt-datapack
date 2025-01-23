# @executor: 掉落物实体
# > 作用：使物品掉落物实体的selector标签的值变成下一个玩家的GUUID，同时更新指南针

# 以丢弃者为执行者执行函数
execute unless data entity @s Item.components."minecraft:custom_data"."mh:tracker".selector \
    on origin run function mh:compass/select/reset
execute if data entity @s Item.components."minecraft:custom_data"."mh:tracker".selector \
    on origin run function mh:compass/select/scroll with entity @s Item.components."minecraft:custom_data"."mh:tracker"

# 找到新目标，更改selector标签
execute store success score #result mh.temp run \
    data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".selector set from storage gu:main out

# 如果result为1（说明selector改变了），则更新指南针
execute if score #result mh.temp matches 0 run \
    return fail
data remove storage mh:temp in
data modify storage mh:temp in.slot set value "contents"
data modify storage mh:temp in.selector set from storage gu:main out
execute on origin run data modify storage mh:temp in.dimension set from entity @s Dimension

# 调用更新函数
execute at @s run function mh:compass/update/update_cmd_template with storage mh:temp in
