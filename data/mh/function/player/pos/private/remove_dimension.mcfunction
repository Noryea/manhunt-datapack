# @args: {dimension: 要删除的维度, guuid: 玩家GUUID}
# @output 在 mh:pdb 删除 "guuid":[{dimension:"dimension"}]
$data remove storage mh:pdb "$(guuid)".trail[{dimension:"$(dimension)"}]
