execute align xyz run summon armor_stand ~ ~ ~ {Marker:1b,UUID:[I;0,0,0,12873326]}

execute store result score target_x mh.temp run data get storage mh:temp Pos.X 1
execute store result score target_y mh.temp run data get storage mh:temp Pos.Y 1
execute store result score target_z mh.temp run data get storage mh:temp Pos.Z 1
execute store result score self_x mh.temp run data get entity 0-0-0-0-0c46e6e Pos[0] 1
execute store result score self_y mh.temp run data get entity 0-0-0-0-0c46e6e Pos[1] 1
execute store result score self_z mh.temp run data get entity 0-0-0-0-0c46e6e Pos[2] 1
scoreboard players operation vec_x mh.temp = target_x mh.temp
scoreboard players operation vec_y mh.temp = target_y mh.temp
scoreboard players operation vec_z mh.temp = target_z mh.temp

scoreboard players operation vec_x mh.temp -= self_x mh.temp
scoreboard players operation vec_y mh.temp -= self_y mh.temp
scoreboard players operation vec_z mh.temp -= self_z mh.temp

execute as 0-0-0-0-0c46e6e at @s run function mh:compass/distance_math/marker
