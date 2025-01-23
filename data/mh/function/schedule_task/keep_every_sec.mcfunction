# 确保每秒执行且只执行一次
schedule function mh:schedule_task/keep_every_sec 1s replace

# BOSSBAR同步
execute unless score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze visible false
execute if score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze visible true
execute store result bossbar mh:freeze value run scoreboard players get hunters.freeze mh.temp
execute if score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze name [{"text":"猎人冻结: ","color":"white","bold":true},{"score":{"name": "hunters.freeze","objective": "mh.temp"},"color":"aqua","bold": true},{"text":"s","color":"white","bold":true}]

bossbar set mh:freeze players @a
