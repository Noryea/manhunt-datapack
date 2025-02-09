# @args: {guuid}
data remove storage mh:temp trailDimensions
$data modify storage mh:temp trailDimensions append from storage mh:pdb "$(guuid)".trail[].dimension