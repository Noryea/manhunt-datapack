# set compass
execute in minecraft:overworld run loot replace block 29999985 254 29999984 container.0 loot mh:gameplay/compass

data merge storage mh:temp {Pos:{X:0,Y:0,Z:0}}
execute as @p[tag=tracking,distance=0..] store result storage mh:temp Pos.X int 1 run data get entity @s Pos[0]
execute as @p[tag=tracking,distance=0..] store result storage mh:temp Pos.Y int 1 run data get entity @s Pos[1]
execute as @p[tag=tracking,distance=0..] store result storage mh:temp Pos.Z int 1 run data get entity @s Pos[2]
execute unless entity @p[tag=tracking,distance=0..] if data entity @s {Dimension:"minecraft:the_end"} as @p[tag=tracking] run function mh:compass/pos_per_dimension/the_end
execute unless entity @p[tag=tracking,distance=0..] if data entity @s {Dimension:"minecraft:overworld"} as @p[tag=tracking] run function mh:compass/pos_per_dimension/overworld
execute unless entity @p[tag=tracking,distance=0..] if data entity @s {Dimension:"minecraft:the_nether"} as @p[tag=tracking] run function mh:compass/pos_per_dimension/the_nether

data modify storage mh:temp Dimension set from entity @p[tag=tracking] Dimension
execute if data storage mh:temp {Dimension:"minecraft:the_end"} run data modify storage mh:temp Dimension set value "末地"
execute if data storage mh:temp {Dimension:"minecraft:overworld"} run data modify storage mh:temp Dimension set value "主世界"
execute if data storage mh:temp {Dimension:"minecraft:the_nether"} run data modify storage mh:temp Dimension set value "下界"

execute in minecraft:overworld positioned 29999985 254 29999984 run data modify block ~ ~ ~ Items[0].tag.LodestoneDimension set from entity @s Dimension
execute in minecraft:overworld positioned 29999985 254 29999984 run data modify block ~ ~ ~ Items[0].tag.LodestonePos set from storage mh:temp Pos
