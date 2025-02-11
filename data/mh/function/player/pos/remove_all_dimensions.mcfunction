# @args: {out: 玩家GUUID}
# @output 在 mh:pdb 删除 "out".trail
$data remove storage mh:pdb "$(out)".trail

# 删除临时nbt
$data remove storage mh:temp latestPos."$(out)"