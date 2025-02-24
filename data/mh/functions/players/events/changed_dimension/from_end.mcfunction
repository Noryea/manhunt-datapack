#返回上一维度自己的位置
scoreboard players operation @s mh.pos.x.1 = @s mh.pos.x
scoreboard players operation @s mh.pos.y.1 = @s mh.pos.y
scoreboard players operation @s mh.pos.z.1 = @s mh.pos.z

#更新pos记分项
execute store result score @s mh.pos.x run data get entity @s Pos[0] 1
execute store result score @s mh.pos.y run data get entity @s Pos[1] 1
execute store result score @s mh.pos.z run data get entity @s Pos[2] 1

#返回现在维度自己来的位置
execute if data entity @s {Dimension:"minecraft:overworld"} run scoreboard players operation @s mh.pos.x.0 = @s mh.pos.x
execute if data entity @s {Dimension:"minecraft:overworld"} run scoreboard players operation @s mh.pos.y.0 = @s mh.pos.y
execute if data entity @s {Dimension:"minecraft:overworld"} run scoreboard players operation @s mh.pos.z.0 = @s mh.pos.z

execute if data entity @s {Dimension:"minecraft:the_nether"} run scoreboard players operation @s mh.pos.x.-1 = @s mh.pos.x
execute if data entity @s {Dimension:"minecraft:the_nether"} run scoreboard players operation @s mh.pos.y.-1 = @s mh.pos.y
execute if data entity @s {Dimension:"minecraft:the_nether"} run scoreboard players operation @s mh.pos.z.-1 = @s mh.pos.z

#确定未曾来过同一维度的玩家的位置
tag @s add self

execute if data entity @s {Dimension:"minecraft:overworld"} as @a unless score @s mh.pos.x.0 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.x.0 = @p[tag=self] mh.pos.x
execute if data entity @s {Dimension:"minecraft:overworld"} as @a unless score @s mh.pos.y.0 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.y.0 = @p[tag=self] mh.pos.y
execute if data entity @s {Dimension:"minecraft:overworld"} as @a unless score @s mh.pos.z.0 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.z.0 = @p[tag=self] mh.pos.z

execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.x.-1 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.x.-1 = @p[tag=self] mh.pos.x
execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.y.-1 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.y.-1 = @p[tag=self] mh.pos.y
execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.z.-1 matches -2147483648..2147483647 run scoreboard players operation @s mh.pos.z.-1 = @p[tag=self] mh.pos.z
tag @s remove self

advancement revoke @s from mh:detect/root