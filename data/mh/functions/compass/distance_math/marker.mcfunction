data merge storage mh:temp {MarkerPos:[0d,0d,0d]}
execute store result storage mh:temp MarkerPos[0] double 0.001 run scoreboard players get target_x mh.temp
execute store result storage mh:temp MarkerPos[1] double 0.001 run scoreboard players get target_y mh.temp
execute store result storage mh:temp MarkerPos[2] double 0.001 run scoreboard players get target_z mh.temp
data modify entity @s Pos set from storage mh:temp MarkerPos

execute facing entity @s feet run function mh:compass/distance_math/return
kill @s