execute unless score @s mh.uid matches 1.. run tag @s remove has.uid

tag @s add self
##事件
execute if score @s mh.died matches 1.. run function mh:players/events/die
execute if score @s mh.join matches 1.. run function mh:players/events/join
execute if score @s mh.join.hunters matches 1.. run function mh:players/events/join_hunters
execute if score @s mh.join.runners matches 1.. run function mh:players/events/join_runners
execute if entity @s[advancements={mh:detect/enter_dimensions_from_end=true}] run function mh:players/events/changed_dimension/from_end
execute if entity @s[advancements={mh:detect/enter_dimensions_from_overworld=true}] run function mh:players/events/changed_dimension/from_overworld
execute if entity @s[advancements={mh:detect/enter_dimensions_from_nether=true}] run function mh:players/events/changed_dimension/from_nether
tag @s remove self

execute unless entity @s[team=hunters] run advancement revoke @s only mh:gui/hunter
execute if entity @s[team=hunters] run advancement grant @s only mh:gui/hunter
execute unless entity @s[team=runners] run advancement revoke @s only mh:gui/runner
execute if entity @s[team=runners] run advancement grant @s only mh:gui/runner

##获取坐标
execute store result score @s mh.pos.x run data get entity @s Pos[0] 1
execute store result score @s mh.pos.y run data get entity @s Pos[1] 1
execute store result score @s mh.pos.z run data get entity @s Pos[2] 1

##触发器
scoreboard players enable @s mh.tracking

scoreboard players reset @s mh.join
scoreboard players reset @s mh.join.hunters
scoreboard players reset @s mh.join.runners

execute if score 允许自由选队 mh.settings matches 1 run scoreboard players enable @s mh.join
execute if score 允许自由选队 mh.settings matches 1 run scoreboard players enable @s mh.join.hunters
execute if score 允许自由选队 mh.settings matches 1 run scoreboard players enable @s mh.join.runners
