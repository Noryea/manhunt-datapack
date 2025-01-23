# 0:右键更新 1:手持更新 2:定期更新
execute if score 追踪器:更新模式 mh.settings matches 0 run \
    return run function mh:schedule_task/schedule_for {function:"mh:schedule_task/keep_update",ticks:20}

data remove storage mh:temp schedule
data modify storage mh:temp schedule.functon set value "mh:schedule_task/keep_update"
execute if score 追踪器:更新模式 mh.settings matches 3 \
    store result storage mh:temp schedule.ticks int 20 run scoreboard players get 追踪器:定期更新周期秒数 mh.settings

function mh:schedule_task/schedule_for with storage mh:temp schedule

