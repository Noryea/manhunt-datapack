schedule function mh:schedule_task/dragon_find 1s replace
execute unless score 检测末影龙死亡 mh.settings matches 1 run return fail

# lever 检查：轮到生命检测阶段则跳过
execute if score dragon_timer_state mh.temp matches 1 run return fail
# 寻找末影龙
execute as @e[type=ender_dragon,limit=1] at @s unless data entity @s {DragonPhase:9} run function mh:schedule_task/dragon_find/found
