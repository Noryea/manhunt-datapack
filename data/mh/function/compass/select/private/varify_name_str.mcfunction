# @args: {raw: 要检查的字符串}
# > 如果含非法字符，返回fail

# 复制字符串
$data modify storage mh:temp TextBuffer set value "$(raw)"

# 初始化记分板变量
execute store result score #len mh.temp run data get storage mh:temp TextBuffer
scoreboard players set #iter mh.temp 0
scoreboard players set #result mh.temp 1

# 如果是空串，返回1
execute if score #len mh.temp matches 0 run \
    return 1

# 遍历
function mh:compass/select/private/varify_char_foreach

# 返回result的值
return run scoreboard players get #result mh.temp