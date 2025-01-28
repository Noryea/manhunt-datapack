# @args: {guuid}
# @output: {out: {pos: [I;x,y,z], dimension: string}} 在mh:temp

# 读取坐标
$data modify storage mh:temp out.pos set from entity $(guuid) Pos
# 读取维度(划掉）
## 性能差
#data modify storage mh:temp out.dimension set from entity @s Dimension