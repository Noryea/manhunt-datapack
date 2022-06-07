#确定未曾来过同一维度的玩家的位置
execute if data entity @s {Dimension:"minecraft:the_end"} as @a unless score @s mh.pos.x.1 matches -2147483648..2147483647 store result score @s mh.pos.x.1 run data get entity @p[tag=self] Pos[0] 1
execute if data entity @s {Dimension:"minecraft:the_end"} as @a unless score @s mh.pos.y.1 matches -2147483648..2147483647 store result score @s mh.pos.y.1 run data get entity @p[tag=self] Pos[1] 1
execute if data entity @s {Dimension:"minecraft:the_end"} as @a unless score @s mh.pos.z.1 matches -2147483648..2147483647 store result score @s mh.pos.z.1 run data get entity @p[tag=self] Pos[2] 1

execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.x.-1 matches -2147483648..2147483647 store result score @s mh.pos.x.-1 run data get entity @p[tag=self] Pos[0] 1
execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.y.-1 matches -2147483648..2147483647 store result score @s mh.pos.y.-1 run data get entity @p[tag=self] Pos[1] 1
execute if data entity @s {Dimension:"minecraft:the_nether"} as @a unless score @s mh.pos.z.-1 matches -2147483648..2147483647 store result score @s mh.pos.z.-1 run data get entity @p[tag=self] Pos[2] 1

#返回上一维度自己的位置
scoreboard players operation @s mh.pos.x.0 = @s mh.pos.x
scoreboard players operation @s mh.pos.y.0 = @s mh.pos.y
scoreboard players operation @s mh.pos.z.0 = @s mh.pos.z

#返回现在维度自己来的位置
execute if data entity @s {Dimension:"minecraft:the_end"} store result score @s mh.pos.x.1 run data get entity @p[tag=self] Pos[0] 1
execute if data entity @s {Dimension:"minecraft:the_end"} store result score @s mh.pos.y.1 run data get entity @p[tag=self] Pos[1] 1
execute if data entity @s {Dimension:"minecraft:the_end"} store result score @s mh.pos.z.1 run data get entity @p[tag=self] Pos[2] 1

execute if data entity @s {Dimension:"minecraft:the_nether"} store result score @s mh.pos.x.-1 run data get entity @p[tag=self] Pos[0] 1
execute if data entity @s {Dimension:"minecraft:the_nether"} store result score @s mh.pos.y.-1 run data get entity @p[tag=self] Pos[1] 1
execute if data entity @s {Dimension:"minecraft:the_nether"} store result score @s mh.pos.z.-1 run data get entity @p[tag=self] Pos[2] 1

advancement revoke @s from mh:detect/root