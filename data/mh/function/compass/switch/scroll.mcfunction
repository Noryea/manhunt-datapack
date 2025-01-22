# @args {GUUID: 旧目标的GUUID}
# >根据GUUID获取下一个追踪对象,执行gu的generate函数

# 给可追踪目标加上mh.trackable标签
function mh:compass/switch/filter_trackable

# 如果旧目标不在服务器内，则第一个人是新目标
$execute unless entity $(GUUID) \
    as @a[sort=arbitrary,tag=mh.trackable,limit=1] at @s run function mh:gu/generate
$execute unless entity $(GUUID) run return run tag @a remove mh.trackable

# 缓存旧目标的UUID
$data modify storage mh:temp oldUUID set from entity $(GUUID) UUID

# 初始化记分板变量
scoreboard players set #iter mh.temp 0
scoreboard players set #old_ptr mh.temp -1
execute store result score #trackable_count mh.temp if entity @a[tag=mh.trackable]
execute if score #trackable_count mh.temp matches 0 run \
    return fail

# 遍历
execute as @a[sort=arbitrary,tag=mh.trackable] run function mh:compass/switch/scroll_foreach

#
tellraw @s {"nbt":"out","storage": "gu:main"}

# 移除所有玩家的标签
tag @a remove mh.trackable