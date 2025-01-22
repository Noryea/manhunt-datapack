
# @output 在 mh:temp 储存 out: {pos: [I;x,y,z], dimension: string}

# 构造定长int数组
data modify storage mh:temp out.pos set value [I;0,0,0]
# 读取坐标
data modify storage mh:temp out.pos[0] set from entity @s Pos[0]
data modify storage mh:temp out.pos[1] set from entity @s Pos[1]
data modify storage mh:temp out.pos[2] set from entity @s Pos[2]
# 读取维度
data modify storage mh:temp out.dimension set from entity @s Dimension
return 1