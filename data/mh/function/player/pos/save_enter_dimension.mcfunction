# @args: {out: the GUUID}
# @output: 在mh:pdb的"out".[]中储存玩家在上一个维度的pos和dimension

# Debug Info
$tellraw @a {"nbt":"LastPos.\"$(out)\"","storage": "mh:temp"}

# 先删除上一个维度的标签
data remove storage mh:temp in
$data modify storage mh:temp in.dimension set from storage mh:temp LastPos."$(out)".dimension
$data modify storage mh:temp in.guuid set value "$(out)"
$execute if data storage mh:pdb "$(out)" run \
    function mh:player/pos/remove_dimension with storage mh:temp in

# 如果没有列表则初始化列表
$execute unless data storage mh:pdb "$(out)" run data modify storage mh:pdb "$(out)" set value []

# 保存标签
$data modify storage mh:pdb "$(out)" prepend from storage mh:temp LastPos."$(out)"
