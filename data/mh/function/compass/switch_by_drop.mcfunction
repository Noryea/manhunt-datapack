# @executor: 掉落物实体

# 复制旧目标的GUUID到mh:temp的in.selector键
data remove storage mh:temp in
data modify storage mh:temp in.selector set from entity @s Item.components."minecraft:custom_data"."mh:tracker".selected

# 以丢弃者为执行者执行函数
execute unless data entity @s Item.components."minecraft:custom_data"."mh:tracker".selected \
    on origin run function mh:compass/select/reset
execute if data entity @s Item.components."minecraft:custom_data"."mh:tracker".selected \
    on origin run function mh:compass/select/scroll with storage mh:temp in

# 找到新目标，更改selected标签
execute store success score #result mh.temp run \
    data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".selected set \
        from storage gu:main out

# 若替换GUUID成功，将旧目标的位置记在"mh:tracker".memories
execute if score #result mh.temp matches 1 run \
    function mh:compass/util/save_memory_for_guuid with storage mh:temp in
# 若替换GUUID成功，从"mh:tracker".memories中读取新目标的位置
execute if score #result mh.temp matches 1 run \
    function mh:compass/util/restore_memory_for_guuid with entity @s Item.components."minecraft:custom_data"."mh:tracker".selected

