## 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新

# 防止在别的更新模式显示boss条
execute unless score 追踪器:更新模式 mh.settings matches 3 run bossbar set mh:compass_timer visible false

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
    as @a[gamemode=!spectator] at @s run function mh:compass/refresh/hotbar
## 手持更新
execute if score 追踪器:更新模式 mh.settings matches 2 \
    as @a[gamemode=!spectator] at @s run function mh:compass/refresh/weapon_mainhand
execute if score 追踪器:更新模式 mh.settings matches 2 \
    as @a[gamemode=!spectator] at @s run function mh:compass/refresh/weapon_offhand

## 定期更新（即全背包更新）
# early return
execute unless score 追踪器:更新模式 mh.settings matches 3 run return fail
# 
scoreboard players remove 定期更新倒计时 mh.temp 1
execute unless score 定期更新倒计时 mh.temp matches 1.. run scoreboard players operation 定期更新倒计时 mh.temp = 追踪器:定期更新周期秒数 mh.settings
execute if score 定期更新倒计时 mh.temp > 追踪器:定期更新周期秒数 mh.settings run scoreboard players operation 定期更新倒计时 mh.temp = 追踪器:定期更新周期秒数 mh.settings
# 倒计时完了，获取最新坐标
execute if score 定期更新倒计时 mh.temp = 追踪器:定期更新周期秒数 mh.settings \
    as @a[gamemode=!spectator] run function mh:player/pos/update_all_pdb with storage gu:main
# boss条同步
bossbar set mh:compass_timer players @a
execute if score 追踪器:定期更新计时器bossBar mh.settings matches 1 run bossbar set mh:compass_timer visible true
execute unless score 追踪器:定期更新计时器bossBar mh.settings matches 1 run bossbar set mh:compass_timer visible false
bossbar set mh:compass_timer name [{"text":"距离指南针更新还有: ","color":"white"},{"score":{"name": "定期更新倒计时","objective": "mh.temp"},"color":"yellow"},{"text":"s","color":"white"}]
execute store result bossbar mh:compass_timer max run scoreboard players get 追踪器:定期更新周期秒数 mh.settings
execute store result bossbar mh:compass_timer value run scoreboard players get 定期更新倒计时 mh.temp
# 更新追踪者的指南针
execute as @a[gamemode=!spectator] at @s run function mh:compass/refresh/inventory

