# @args: in.guuid和in.dimension 在mh.temp
# @executor: 要读取坐标的玩家，但执行位置是指南针持有者（即不一定维度和玩家相同）
# @output {in:{target: {pos: [x,y,z], dimension: string}, exactDimension: string } } 在mh:temp
#> 判断玩家维度是不是dimension, 是则获取当前坐标，不是则获取存储坐标

# 优化：如果在同一tick内重复读取，直接返回lastOutput
# TODO: 这只是读取维度的字符串长度，对自定义维度的适配性不好
execute store result score 当前dimension mh.pdb.querydimension run data get storage mh:temp in.dimension
execute unless data storage mh:temp {in:{dimension:"minecraft:overworld"}} unless data storage mh:temp {in:{dimension:"minecraft:the_nether"}} unless data storage mh:temp {in:{dimension:"minecraft:the_end"}} run \
    scoreboard players reset @s mh.pdb.querydimension
execute if score @s mh.pdb.querytime = 当前gametime mh.temp if score @s mh.pdb.querydimension = 当前dimension mh.pdb.querydimension run \
    return run function mh:player/pos/private/get_lastoutput with storage mh:temp in

# 先设置输出成空标签
data modify storage mh:temp in.target set value {}

# 判断维度
scoreboard players set #result mh.temp 0
execute at @s store result score #result mh.temp run function mh:player/pos/private/check_dimension with storage mh:temp in
# 如果当前玩家的维度不是(dimension)，读取数据库
execute unless score #result mh.temp matches 1 run function mh:player/pos/private/get_dimension with storage mh:temp in
# 是(dimension)则返回当前的方块坐标
execute if score #result mh.temp matches 1 at @s summon marker run function mh:player/pos/__marker_block_pos
data modify storage mh:temp in.target.dimension set from storage mh:temp in.dimension

# 保存输出到lastOutput
function mh:player/pos/private/save_lastoutput with storage mh:temp in
scoreboard players operation @s mh.pdb.querytime = 当前gametime mh.temp
scoreboard players operation @s mh.pdb.querydimension = 当前dimension mh.pdb.querydimension
# data remove storage mh:temp TextBuffer