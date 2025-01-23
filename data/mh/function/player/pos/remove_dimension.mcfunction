# @args: {dimension: 要删除的维度, UUID: 玩家UUID}
# @output 在 mh:pdb 删除 "UUID":[{dimension:"dimension"}]
$data remove storage mh:pdb "$(UUID)"[{dimension:"$(dimension)"}]
