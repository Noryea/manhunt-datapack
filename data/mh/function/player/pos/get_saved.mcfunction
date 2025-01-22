# @args {dimension: 调用者的维度, UUID: 玩家UUID}
# @output {out: {pos: [I;x,y,z], dimension: string}} 在mh:temp
#    若没有找到，则为{out: {}}

# 先设置成空标签
data remove storage mh:temp out
# 用传入的UUID读取数据库
$data modify storage mh:temp out set from storage mh:pdb "$(UUID)"[{dimension:"$(dimension)"}]
# 如果没有读到坐标，返回fail
execute unless data storage mh:temp out.pos run return fail

return 2