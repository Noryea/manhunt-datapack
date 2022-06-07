summon area_effect_cloud ^ ^ ^1 {Radius:0f,UUID:[I;0,0,0,234]}
execute store result score unit_x mh.temp run data get entity 0-0-0-0-0ea Pos[0] 1000
execute store result score unit_y mh.temp run data get entity 0-0-0-0-0ea Pos[1] 1000
execute store result score unit_z mh.temp run data get entity 0-0-0-0-0ea Pos[2] 1000
scoreboard players operation unit_x mh.temp -= self_x mh.temp
scoreboard players operation unit_y mh.temp -= self_y mh.temp
scoreboard players operation unit_z mh.temp -= self_z mh.temp

scoreboard players set #num100 mh.temp 100
scoreboard players set #num1000 mh.temp 1000
scoreboard players operation vec_x mh.temp /= #num100 mh.temp
scoreboard players operation vec_y mh.temp /= #num100 mh.temp
scoreboard players operation vec_z mh.temp /= #num100 mh.temp

scoreboard players operation unit_x mh.temp *= vec_x mh.temp
scoreboard players operation unit_y mh.temp *= vec_y mh.temp
scoreboard players operation unit_z mh.temp *= vec_z mh.temp

scoreboard players operation unit_x mh.temp /= #num1000 mh.temp
scoreboard players operation unit_y mh.temp /= #num1000 mh.temp
scoreboard players operation unit_z mh.temp /= #num1000 mh.temp


scoreboard players operation value mh.temp = unit_x mh.temp
scoreboard players operation value mh.temp += unit_y mh.temp
scoreboard players operation value mh.temp += unit_z mh.temp

execute store result storage mh:temp Distance int 0.1 run scoreboard players get value mh.temp
kill 0-0-0-0-0ea
#scoreboard players reset * mh.temp