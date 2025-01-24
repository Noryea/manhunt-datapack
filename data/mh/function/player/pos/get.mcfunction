# @args: {guuid, dimension}
# @output {out: {pos: [x,y,z], dimension: string}} 在mh:temp
# > 判断执行维度是不是dimension, 是则获取当前坐标，不是则获取存储坐标

# 生成GUUID
# function mh:gu/generate

# 如果当前玩家的维度是$(dimension)，返回当前的坐标
$execute at $(guuid) if dimension $(dimension) run \
    function mh:player/pos/get_current {guuid: $(guuid)}
$data modify storage mh:temp out.dimension set value "$(dimension)"

# 否则读取数据库
$execute at $(guuid) unless dimension $(dimension) run \
    function mh:player/pos/get_saved {guuid: $(guuid), dimension: "$(dimension)"}
