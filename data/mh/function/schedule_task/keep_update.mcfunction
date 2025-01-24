## 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新

## 计算多少秒后重新运行一次
# 更新模式为右键更新：1秒后运行并early return
execute if score 追踪器:更新模式 mh.settings matches 0 run \
    return run schedule function mh:schedule_task/keep_update 1s replace
# 更新模式为定期更新：1秒后运行
execute if score 追踪器:更新模式 mh.settings matches 3 run \
    schedule function mh:schedule_task/keep_update 1s replace

# 更新模式为快捷栏更新↓
execute if score 追踪器:更新模式 mh.settings matches 1 store result storage mh:temp schedule.ticks int 1 \
    run scoreboard players get 追踪器:快捷栏更新周期游戏刻 mh.settings
# 更新模式为手持更新↓
execute if score 追踪器:更新模式 mh.settings matches 2 store result storage mh:temp schedule.ticks int 1 \
    run scoreboard players get 追踪器:手持更新周期游戏刻 mh.settings
# 动态地计划重新运行
execute unless score 追踪器:更新模式 mh.settings matches 0 unless score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp schedule.function set value "mh:schedule_task/keep_update"
execute unless score 追踪器:更新模式 mh.settings matches 0 unless score 追踪器:更新模式 mh.settings matches 3 run \
    function mh:schedule_task/schedule_for with storage mh:temp schedule

## 快捷栏更新
execute if score 追踪器:更新模式 mh.settings matches 1 \
    as @a[gamemode=!spectator] at @s run function mh:compass/update/hotbar
## 手持更新
execute if score 追踪器:更新模式 mh.settings matches 2 \
    as @a[gamemode=!spectator] at @s run function mh:compass/update/weapon_mainhand
execute if score 追踪器:更新模式 mh.settings matches 2 \
    as @a[gamemode=!spectator] at @s run function mh:compass/update/weapon_offhand
## 定期更新（即全背包更新）
execute if score 追踪器:更新模式 mh.settings matches 3 \
    as @a[gamemode=!spectator] at @s run function mh:compass/update/inventory

