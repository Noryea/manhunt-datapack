# 确保每秒执行且只执行一次
schedule function mh:schedule_task/keep_freeze 1s replace

## 效果
# 1.21(.1)
execute if score 猎人冻结倒计时 mh.temp matches 1.. as @a[team=hunters] run function mh:player/__freeze_me_old
execute unless score 猎人冻结倒计时 mh.temp matches 1.. as @a[team=hunters] run function mh:player/__unfreeze_me_old
execute as @a[team=!hunters] run function mh:player/__unfreeze_me_old
# 1.21.3+
execute if score 猎人冻结倒计时 mh.temp matches 1.. as @a[team=hunters] run function mh:player/__freeze_me
execute unless score 猎人冻结倒计时 mh.temp matches 1.. as @a[team=hunters] run function mh:player/__unfreeze_me
execute as @a[team=!hunters] run function mh:player/__unfreeze_me

## BOSSBAR同步
# early return
execute unless score 猎人冻结倒计时 mh.temp matches 1.. run \
    return run bossbar set mh:freeze visible false
bossbar set mh:freeze visible true
execute store result bossbar mh:freeze value run scoreboard players get 猎人冻结倒计时 mh.temp
bossbar set mh:freeze name [{"text":"猎人冻结: ","color":"white","bold":true},{"score":{"name": "猎人冻结倒计时","objective": "mh.temp"},"color":"aqua","bold": true},{"text":"s","color":"white","bold":true}]
bossbar set mh:freeze players @a

# 计分项自减
execute if score 猎人冻结倒计时 mh.temp matches 1.. run scoreboard players remove 猎人冻结倒计时 mh.temp 1