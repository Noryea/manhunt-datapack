# @args {dimension: 调用者的维度, UUID: 玩家UUID}
# @output {LocationCompound: {pos: [I;x,y,z], dimension: string}} 在mh:temp
#    若没有找到，则为{LocationCompound: {}}

# 先设置成空标签
data remove storage mh:temp LocationCompound
# 用传入的UUID读取数据库
$data modify storage mh:temp LocationCompound set from storage mh:pdb "$(UUID)"[{dimension:"$(dimension)"}]
# 如果没有读到坐标，返回fail
execute unless data storage mh:temp LocationCompound.pos run return fail

return 2