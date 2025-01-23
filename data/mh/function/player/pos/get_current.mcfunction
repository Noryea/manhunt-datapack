# @output: {out: {pos: [I;x,y,z], dimension: string}} 在mh:temp

# 先设置成空标签
data modify storage mh:temp out set value {}
# 读取坐标
data modify storage mh:temp out.pos set from entity @s Pos
# 读取维度
## 性能差
#data modify storage mh:temp out.dimension set from entity @s Dimension