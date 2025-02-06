# > 用于遍历trackable玩家

# 如果上一个遍历的玩家是旧目标，则当前遍历的是新目标
execute if score #iter mh.temp = #old_ptr mh.temp run \
    function mh:gu/generate

# iter++
scoreboard players add #iter mh.temp 1

# 如果已经遍历到最后，则第一个人是新目标
execute if score #old_ptr mh.temp matches -1 \
    if score #iter mh.temp = #len mh.temp \
        as @a[sort=arbitrary,tag=mh.trackable,limit=1] at @s run return run function mh:gu/generate

# 如果已经找到旧目标的指针位置,则不往下运行
execute unless score #old_ptr mh.temp matches -1 run return fail

# 判断是否等于旧目标
data modify storage mh:temp oldUUIDCopy set from storage mh:temp oldUUID
execute store success score #result mh.temp run data modify storage mh:temp oldUUIDCopy set from entity @s UUID
# 等于旧目标，则记下此时iter的值
execute if score #result mh.temp matches 0 run scoreboard players operation #old_ptr mh.temp = #iter mh.temp
