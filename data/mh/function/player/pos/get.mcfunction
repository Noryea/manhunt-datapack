# @args {Dimension: 调用者的维度}
# @output {LocationCompound: {pos: [I;x,y,z], dimension: string}} 在mh:temp

# 如果当前玩家的维度是$(dimension)，返回当前的坐标
$execute if data entity @s {Dimension:"$(Dimension)"} run \
    return run function mh:player/pos/get_current

# 否则读取数据库
data remove storage mh:temp CommandMacro
$data modify storage mh:temp CommandMacro.dimension set value "$(Dimension)"
data modify storage mh:temp CommandMacro.UUID set from entity @s UUID

return run function mh:player/pos/get_saved with storage mh:temp CommandMacro