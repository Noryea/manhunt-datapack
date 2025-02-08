# @args: {out: the GUUID}
data remove storage mh:temp trailDimensions
$data modify storage mh:temp trailDimensions append from storage mh:pdb "$(out)".trail[].dimension
# 还有玩家所在维度
# pos get函数有优化，所以重复加的影响不大
$data modify storage mh:temp trailDimensions append from entity $(out) Dimension