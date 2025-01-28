# @args: {guuid, dimension}
# @output {out: {pos: [x,y,z], dimension: string}} 在mh:temp
# > 判断执行维度是不是dimension, 是则获取当前坐标，不是则获取存储坐标

# 优化：如果在同一tick内重复读取，直接返回lastOutPut
execute store result score 当前gametime mh.pdb.querytime run time query gametime
$execute if score @s mh.pdb.querytime = 当前gametime mh.pdb.querytime run \
    return run data modify storage mh:temp out set from storage mh:temp lastOutPut."$(guuid)"

# 如果当前玩家的维度是$(dimension)，返回当前的坐标
$execute at $(guuid) if dimension $(dimension) run \
    function mh:player/pos/get_current {guuid: $(guuid)}
$data modify storage mh:temp out.dimension set value "$(dimension)"

# 否则读取数据库
$execute at $(guuid) unless dimension $(dimension) run \
    function mh:player/pos/get_saved {guuid: $(guuid), dimension: "$(dimension)"}

# 保存到lastOutPut
$data modify storage mh:pdb lastOutPut."$(guuid)" set from storage mh:temp out
$scoreboard players operation $(guuid) mh.pdb.querytime = 当前gametime mh.pdb.querytime