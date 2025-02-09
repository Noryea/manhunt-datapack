# @args: {out: the GUUID}
# @output: 在mh:pdb的"out".[]中储存玩家在上一个维度的pos和dimension

# Debug Info
#$tellraw @a {"nbt":"latestPos.\"$(out)\"","storage": "mh:temp"}

# 先删除上一个维度的nbt
data remove storage mh:temp in
$data modify storage mh:temp in.dimension set from storage mh:temp latestPos."$(out)".dimension
$data modify storage mh:temp in.guuid set value "$(out)"
$execute if data storage mh:pdb "$(out)" run \
    function mh:player/pos/private/remove_dimension with storage mh:temp in

# 保存临时nbt到玩家数据库
$data modify storage mh:pdb "$(out)".trail prepend from storage mh:temp latestPos."$(out)"

# 删除临时nbt
$data remove storage mh:temp latestPos."$(out)"
