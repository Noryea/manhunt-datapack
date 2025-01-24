# @executor 玩家
# @args {guuid: 旧目标的选择器}
# >根据guuid对应的玩家获取下一个追踪对象,执行gu的generate函数

# 如果旧目标不在服务器内，则重置选择
$execute unless entity $(guuid) run \
    return run function mh:compass/select/reset

# 给可追踪目标加上mh.trackable标签
function mh:player/filter_trackable

# 缓存旧目标的UUID
$data modify storage mh:temp oldUUID set from entity $(guuid) UUID

# 初始化记分板变量
scoreboard players set #iter mh.temp 0
scoreboard players set #old_ptr mh.temp -1
execute store result score #len mh.temp if entity @a[tag=mh.trackable]
execute if score #len mh.temp matches 0 run \
    return fail

# 遍历
execute as @a[sort=arbitrary,tag=mh.trackable] run function mh:compass/select/scroll_foreach

# 移除所有玩家的标签
tag @a remove mh.trackable