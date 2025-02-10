# @executor: 要更新所有合法维度的lastOutPut坐标的玩家
# @output: 更新对应玩家的所有lastOutPut坐标
# > 用于定期更新模式下更新目标：目标所在维度和mh:pdb的Trail中的其他维度都来一遍
function mh:gu/generate
data remove storage mh:temp in
data modify storage mh:temp in.guuid set from storage gu:main out

# 数据库里的维度
function mh:player/pos/private/list_trail_dimensions with storage mh:temp in
function mh:player/pos/private/update_pdb_foreach

# 还有玩家自己的维度
execute at @s summon marker run function mh:player/pos/__marker_block_pos
data modify storage mh:temp in.dimension set from entity @s Dimension
data modify storage mh:temp in.target.dimension set from storage mh:temp in.dimension
function mh:player/pos/private/save_lastoutput with storage mh:temp in