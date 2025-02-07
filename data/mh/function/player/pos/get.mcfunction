# @args: {guuid, dimension}
# @output {in:{target: {pos: [x,y,z], dimension: string}, exactDimension: string } } 在mh:temp
# > 判断执行维度是不是dimension, 是则获取当前坐标，不是则获取存储坐标

# 优化：如果在同一tick内重复读取，直接返回lastOutPut
execute store result score 当前gametime mh.pdb.querytime run time query gametime
$execute if score $(guuid) mh.pdb.querytime = 当前gametime mh.pdb.querytime if data storage mh:pdb {"$(guuid)":{lastQueryDimension:"$(dimension)"}} run \
    return run data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".lastOutPut."$(dimension)"

# 先设置输出成空标签
data modify storage mh:temp in.target set value {}

# 如果当前玩家的维度不是(dimension)，读取数据库
$execute at $(guuid) unless dimension $(dimension) run \
    data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".trail[{dimension:"$(dimension)"}]

# 否则返回当前的方块坐标
$execute at $(guuid) if dimension $(dimension) summon marker run function mh:player/pos/__marker_block_pos
# $execute at $(guuid) if dimension $(dimension) run \
    data modify storage mh:temp in.target.pos set from entity $(guuid) Pos
$data modify storage mh:temp in.target.dimension set value "$(dimension)"

# 保存输出到lastOutPut
$data modify storage mh:pdb "$(guuid)".lastQueryDimension set value "$(dimension)"
$data modify storage mh:pdb "$(guuid)".lastOutPut."$(dimension)" set from storage mh:temp in.target
$scoreboard players operation $(guuid) mh.pdb.querytime = 当前gametime mh.pdb.querytime