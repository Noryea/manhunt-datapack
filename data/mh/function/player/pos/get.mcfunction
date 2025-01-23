# @args: {Dimension: 调用者的维度}
# @output {out: {pos: [I;x,y,z], dimension: string}} 在mh:temp

data remove storage mh:temp in
$data modify storage mh:temp in.dimension set value "$(Dimension)"
data modify storage mh:temp in.UUID set from entity @s UUID

# 如果当前玩家的维度是$(dimension)，返回当前的坐标
$execute if data entity @s {Dimension:"$(Dimension)"} run \
    function mh:player/pos/get_current

# 否则读取数据库
$execute unless data entity @s {Dimension:"$(Dimension)"} run \
    function mh:player/pos/get_saved with storage mh:temp in

# 如果更新模式是定期更新, 则保存成lastOutPut
execute if score 追踪器:更新模式 mh.settings matches 3 run \
    function mh:player/pos/save_last_output with storage mh:temp in