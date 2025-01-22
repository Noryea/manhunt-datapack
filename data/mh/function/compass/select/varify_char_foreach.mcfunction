# iter++
scoreboard players add #iter mh.temp 1
# 判断递归终止条件: iter > len
execute if score #iter mh.temp > #len mh.temp run \
    return run scoreboard players get #iter mh.temp

# 第一个字符
data modify storage mh:temp char set string storage mh:temp TextBuffer 0 1

# 将TextBuffer的第一个字符弹出
data modify storage mh:temp TextBuffer set string storage mh:temp TextBuffer 1

# 检查是否为以下字符
# ,!=@]
execute if data storage mh:temp {char:","} run return run scoreboard players set #result mh.temp 0
execute if data storage mh:temp {char:"!"} run return run scoreboard players set #result mh.temp 0
execute if data storage mh:temp {char:"="} run return run scoreboard players set #result mh.temp 0
execute if data storage mh:temp {char:"@"} run return run scoreboard players set #result mh.temp 0
execute if data storage mh:temp {char:"]"} run return run scoreboard players set #result mh.temp 0

# 递归调用
function mh:compass/select/varify_char_foreach