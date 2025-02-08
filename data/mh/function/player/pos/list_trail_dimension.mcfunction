# @args: {out}
data remove storage mh:temp trailDimensions
$data modify storage mh:temp trailDimensions append from storage mh:pdb "$(out)".trail[].dimension