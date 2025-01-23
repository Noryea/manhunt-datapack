# @args: {dimension: 调用者的维度, UUID: 玩家UUID}
# @output: {out: {pos: [I;x,y,z], dimension: string}} 在mh:temp
#    若没有找到，则为{out: {}}

# 先设置成空标签
data modify storage mh:temp out set value {}
# 用传入的UUID读取数据库
$data modify storage mh:temp out set from storage mh:pdb "$(UUID)"[{dimension:"$(dimension)"}]