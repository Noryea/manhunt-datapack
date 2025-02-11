# @args: {dimension: 要删除的维度, guuid: 玩家GUUID}
$data remove storage mh:pdb "$(guuid)".trail[{dimension:"$(dimension)"}]
