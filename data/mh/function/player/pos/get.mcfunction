# @args: {guuid, dimension}
# @output {out: {pos: [x,y,z], dimension: string}} 在mh:temp
# > 判断执行维度是不是dimension, 是则获取当前坐标，不是则获取存储坐标

# 优化：如果在同一tick内重复读取，直接返回lastOutPut
execute store result score 当前gametime mh.pdb.querytime run time query gametime
$execute if score @s mh.pdb.querytime = 当前gametime mh.pdb.querytime run \
    return run data modify storage mh:temp out set from storage mh:temp lastOutPut."$(guuid)"

# 先设置输出成空标签
data modify storage mh:temp out set value {}

# 如果当前玩家的维度不是(dimension)，读取数据库
$execute at $(guuid) unless dimension $(dimension) run \
    data modify storage mh:temp out set from storage mh:pdb "$(guuid)"[{dimension:"$(dimension)"}]

# 否则返回当前的坐标
$execute at $(guuid) if dimension $(dimension) run \
    data modify storage mh:temp out.pos set from entity $(guuid) Pos
$data modify storage mh:temp out.dimension set value "$(dimension)"

# 保存输出到lastOutPut
$data modify storage mh:pdb lastOutPut."$(guuid)" set from storage mh:temp out
$scoreboard players operation $(guuid) mh.pdb.querytime = 当前gametime mh.pdb.querytime