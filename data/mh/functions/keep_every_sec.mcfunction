# 冻结猎人
execute as @p[scores={mh.setting.frz=-2147483648..2147483647}] at @s run function mh:players/events/freeze_hunters

execute if score hunters.freeze mh.temp matches 1.. as @a[team=hunters] at @s run function mh:players/hunters/freeze
execute if score hunters.freeze mh.temp matches 0.. run scoreboard players remove hunters.freeze mh.temp 1

# BOSSBAR同步
bossbar set mh:freeze players @a
execute store result bossbar mh:freeze value run scoreboard players get hunters.freeze mh.temp
execute unless score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze visible false
execute if score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze visible true
execute if score hunters.freeze mh.temp matches 0.. run bossbar set mh:freeze name [{"text":"猎人冻结: ","color":"white","bold":true},{"score":{"name": "hunters.freeze","objective": "mh.temp"},"color":"aqua","bold": true},{"text":"s","color":"white","bold":true}]

#
schedule function mh:keep_every_sec 1s replace