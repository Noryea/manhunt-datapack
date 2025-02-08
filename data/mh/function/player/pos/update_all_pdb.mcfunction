# @executor: 要更新所有合法维度的lastOutPut坐标的玩家
# @output: 更新对应玩家的所有lastOutPut坐标
# > 用于定期更新模式下更新目标：mh:pdb的Trail中的所有维度都来一遍
function mh:gu/generate

# trailDimensions
function mh:player/pos/list_trail_dimension with storage gu:main

data remove storage mh:temp in
data modify storage mh:temp in.guuid set from storage gu:main out
function mh:player/pos/update_pdb_foreach