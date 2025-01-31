# @executor: 要更新追踪坐标的玩家
# @output: 更新所有lastOutPut中的维度
# > 用于定期更新模式下更新目标：主世界、下界、末地各执行一次
function mh:gu/generate
data modify storage mh:temp in.guuid set from storage gu:main out

data modify storage mh:temp in.dimension set value "minecraft:overworld"
function mh:player/pos/get with storage mh:temp in
data modify storage mh:temp in.dimension set value "minecraft:the_nether"
function mh:player/pos/get with storage mh:temp in
data modify storage mh:temp in.dimension set value "minecraft:the_end"
function mh:player/pos/get with storage mh:temp in