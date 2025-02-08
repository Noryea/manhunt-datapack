# unit: 单位向量; vec: 两点间有向线段

# scoreboard players operation unit_x mh.temp *= vec_x mh.temp
# scoreboard players operation unit_y mh.temp *= vec_y mh.temp
# scoreboard players operation unit_z mh.temp *= vec_z mh.temp
# scoreboard players operation value mh.temp = unit_x mh.temp
# scoreboard players operation value mh.temp += unit_y mh.temp
# scoreboard players operation value mh.temp += unit_z mh.temp

# 在面前1格生成药水云, 用于获取单位向量
summon area_effect_cloud ^ ^ ^1.0 {Radius:0f,UUID:[I;0,0,0,234]}

## 记分板的值存在上限，改用属性修饰器来计算
# 盔甲架拥有minecraft:generic.movement_speed属性，借用这个来计算
# 注意MC中计算属性修饰器时，算法为：值=基值*(Amount+1)
scoreboard players set distance mh.temp 0
attribute @s minecraft:generic.movement_speed base set 0
data modify storage mh:temp AttributeModifiers set value [{Amount:-1.0d, Operation:1, UUID:[I;0,0,0,0], Name:"unit_multiplier"},{Amount:0.0d, Operation:0, UUID:[I;0,0,65536,0], Name:"minus_axis"}]
# 缩小100倍，防止触及属性值上限
attribute @s generic.movement_speed modifier add 0-0-0-1-1 "reducer" -0.999 multiply

## x1*x2 = (-self_x + 药水云Pos[0]) * (vec_x - 1 + 1)
# Attributes[0].Base 等于 -self_x
execute store result entity @s Attributes[0].Base double -1 run scoreboard players get self_x mh.temp
# AttributeModifiers[1].Amount 等于 药水云Pos[0]
data modify storage mh:temp AttributeModifiers[1].Amount set from entity 0-0-0-0-0ea Pos[0]
# AttributeModifiers[0]等于 (vec_x - 1)
scoreboard players remove vec_x mh.temp 1
execute store result storage mh:temp AttributeModifiers[0].Amount double 1 run scoreboard players get vec_x mh.temp
# 应用属性修饰器
data modify entity @s Attributes[0].Modifiers set from storage mh:temp AttributeModifiers

execute store result score adder_x mh.temp run attribute @s minecraft:generic.movement_speed get 10000
scoreboard players operation distance mh.temp += adder_x mh.temp
# 清除实体的属性修饰器（否则data modify没效果）
attribute @s generic.movement_speed modifier remove 0-0-0-1-0
attribute @s generic.movement_speed modifier remove 0-0-0-0-0

## y1*y2 = (-self_y + 药水云Pos[1]) * (vec_y - 1 + 1)
execute store result entity @s Attributes[0].Base double -1 run scoreboard players get self_y mh.temp
data modify storage mh:temp AttributeModifiers[1].Amount set from entity 0-0-0-0-0ea Pos[1]
scoreboard players remove vec_y mh.temp 1
execute store result storage mh:temp AttributeModifiers[0].Amount double 1 run scoreboard players get vec_y mh.temp
# 应用属性修饰器
data modify entity @s Attributes[0].Modifiers set from storage mh:temp AttributeModifiers
execute store result score adder_y mh.temp run attribute @s minecraft:generic.movement_speed get 10000
scoreboard players operation distance mh.temp += adder_y mh.temp
# 清除实体的属性修饰器（否则data modify没效果）
attribute @s generic.movement_speed modifier remove 0-0-0-1-0
attribute @s generic.movement_speed modifier remove 0-0-0-0-0

## z1*z2 = (-self_z + 药水云Pos[2]) * (vec_z - 1 + 1)
execute store result entity @s Attributes[0].Base double -1 run scoreboard players get self_z mh.temp
data modify storage mh:temp AttributeModifiers[1].Amount set from entity 0-0-0-0-0ea Pos[2]
scoreboard players remove vec_z mh.temp 1
execute store result storage mh:temp AttributeModifiers[0].Amount double 1 run scoreboard players get vec_z mh.temp
# 应用属性修饰器
data modify entity @s Attributes[0].Modifiers set from storage mh:temp AttributeModifiers
execute store result score adder_z mh.temp run attribute @s minecraft:generic.movement_speed get 10000
scoreboard players operation distance mh.temp += adder_z mh.temp
# 清除实体的属性修饰器（否则data modify没效果）
attribute @s generic.movement_speed modifier remove 0-0-0-1-0
attribute @s generic.movement_speed modifier remove 0-0-0-0-0

kill 0-0-0-0-0ea

# 存值
scoreboard players set #10 mh.temp 10
scoreboard players operation distance_小数点前 mh.temp = distance mh.temp
scoreboard players operation distance_小数点前 mh.temp /= #10 mh.temp
# scoreboard players operation distance_小数点后一位 mh.temp = distance mh.temp
# scoreboard players operation distance_小数点后一位 mh.temp %= #10 mh.temp