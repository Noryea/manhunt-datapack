# @args: {guuid}
# @output: trailDimensions:["维度1","维度2"] 在 mh:temp
#> 列出需要遍历的维度,用于定期更新
data remove storage mh:temp trailDimensions
$data modify storage mh:temp trailDimensions append from storage mh:pdb "$(guuid)".trail[].dimension
# 顺便把lastOutput删除
$data remove storage mh:pdb "$(guuid)".lastOutput