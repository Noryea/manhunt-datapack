# @input {UUID}
# @output 在mh:pdb的"UUID".[]中储存玩家在上一个维度的pos和dimension

# Debug Info
#$tellraw @a {"nbt":"LastPos.\"$(UUID)\"","storage": "mh:temp"}

# 先删除上一个维度的标签
data remove storage mh:temp CommandMacro
$data modify storage mh:temp CommandMacro.dimension set from storage mh:temp LastPos."$(UUID)".dimension
$data modify storage mh:temp CommandMacro.UUID set value "$(UUID)"
function mh:player/pos/remove_dimension with storage mh:temp CommandMacro

# 添加标签
$execute unless data storage mh:pdb "$(UUID)" run data merge storage mh:pdb {"$(UUID)":[]}
$data modify storage mh:pdb "$(UUID)" prepend from storage mh:temp LastPos."$(UUID)"
