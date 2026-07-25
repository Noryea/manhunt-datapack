# @executor: ender dragon
execute if data entity @s {DragonPhase:9} run function mh:schedule_task/dragon_check/dead
execute if data entity @s {Health:0f} run function mh:schedule_task/dragon_check/dead
