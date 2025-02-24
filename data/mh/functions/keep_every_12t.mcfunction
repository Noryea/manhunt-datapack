## 跨维度时
execute as @a[advancements={mh:detect/enter_dimensions_from_end=true}] at @s run function mh:players/events/changed_dimension/from_end
execute as @a[advancements={mh:detect/enter_dimensions_from_overworld=true}] at @s run function mh:players/events/changed_dimension/from_overworld
execute as @a[advancements={mh:detect/enter_dimensions_from_nether=true}] at @s run function mh:players/events/changed_dimension/from_nether

## 记录坐标
execute as @a store result score @s mh.pos.x run data get entity @s Pos[0] 1
execute as @a store result score @s mh.pos.y run data get entity @s Pos[1] 1
execute as @a store result score @s mh.pos.z run data get entity @s Pos[2] 1

## 启用触发器
scoreboard players enable @a mh.tracking
scoreboard players enable @a mh.join
scoreboard players enable @a mh.join.hunters
scoreboard players enable @a mh.join.runners

advancement revoke @a[team=!hunters] only mh:gui/hunter
advancement grant @a[team=hunters] only mh:gui/hunter
advancement revoke @s[team=!runners] only mh:gui/runner
advancement grant @s[team=runners] only mh:gui/runner

# 猎人函数
scoreboard players set #schedule_h_times mh.temp 0
tag @a[team=hunters] add mh.hunter
function mh:scheduled_hunters_func
# 逃者函数
execute as @a[team=runners] at @s run function mh:players/runners/main
# 消除1.16的更新声音
stopsound @a * item.armor.equip_generic
#
schedule function mh:keep_every_12t 12t replace
