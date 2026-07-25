schedule function mh:schedule_task/dragon_health_check 10t replace
execute unless score 检测末影龙死亡 mh.settings matches 1 run return fail

# lever 检查
execute unless score dragon_timer_state mh.temp matches 1 run return fail
function mh:schedule_task/dragon_check/check with storage mh:temp dragon_data