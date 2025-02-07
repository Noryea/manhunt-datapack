##记录坐标
execute as @a store result score @s mh.pos.x run data get entity @s Pos[0] 1
execute as @a store result score @s mh.pos.y run data get entity @s Pos[1] 1
execute as @a store result score @s mh.pos.z run data get entity @s Pos[2] 1

##触发器
scoreboard players enable @a mh.tracking

scoreboard players enable @a mh.join
scoreboard players enable @a mh.join.hunters
scoreboard players enable @a mh.join.runners

# 猎人函数
execute as @a[team=hunters] at @s run function mh:players/hunters/main

# 逃者
execute as @a[team=runners] at @s run function mh:players/runners/main

# 消除1.16的更新声音
stopsound @a * item.armor.equip_generic

#
schedule function mh:keep_every_10t 10t replace
