# @executor: 掉落物实体
#> 作用：使物品掉落物实体的selector标签的值变成下一个玩家的GUUID，同时更新指南针

#
execute unless items entity @s contents compass run \
    return fail

# 以丢弃者为执行者执行函数
data modify storage mh:temp in.selector set from entity @s Item.components."minecraft:custom_data"."mh:tracker".selector
execute on origin run function mh:compass/select/scroll with storage mh:temp in
execute unless data entity @s Item.components."minecraft:custom_data"."mh:tracker".selector \
    on origin run function mh:compass/select/initial

# 找到新目标，更改selector标签
data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".selector set from storage gu:main out
