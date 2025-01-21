
# @output 在 mh:temp 储存 LocationCompound: {pos: [I;x,y,z], dimension: string}

# 构造定长int数组
data modify storage mh:temp LocationCompound.pos set value [I;0,0,0]
# 读取坐标
data modify storage mh:temp LocationCompound.pos[0] set from entity @s Pos[0]
data modify storage mh:temp LocationCompound.pos[1] set from entity @s Pos[1]
data modify storage mh:temp LocationCompound.pos[2] set from entity @s Pos[2]
# 读取维度
data modify storage mh:temp LocationCompound.dimension set from entity @s Dimension
return 1