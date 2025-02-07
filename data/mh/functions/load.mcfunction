team add hunters "猎人"
team modify hunters color red
team add runners "逃者"
team modify runners color green

# 玩家原版三维度坐标
scoreboard objectives add mh.pos.x dummy
scoreboard objectives add mh.pos.x.1 dummy
scoreboard objectives add mh.pos.x.0 dummy
scoreboard objectives add mh.pos.x.-1 dummy

scoreboard objectives add mh.pos.y dummy
scoreboard objectives add mh.pos.y.1 dummy
scoreboard objectives add mh.pos.y.0 dummy
scoreboard objectives add mh.pos.y.-1 dummy

scoreboard objectives add mh.pos.z dummy
scoreboard objectives add mh.pos.z.1 dummy
scoreboard objectives add mh.pos.z.0 dummy
scoreboard objectives add mh.pos.z.-1 dummy

# 触发器
scoreboard objectives add mh.tracking trigger
scoreboard objectives add mh.join trigger {"text":"显示选队界面","clickEvent":{"action":"suggest_command","value":"/trigger mh.join"}}
scoreboard objectives add mh.join.hunters trigger {"text":"加入猎人","color":"red","clickEvent":{"action":"suggest_command","value":"/trigger mh.join.hunters"}}
scoreboard objectives add mh.join.runners trigger {"text":"加入逃者","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger mh.join.runners"}}

# 设置
scoreboard objectives add mh.settings dummy
scoreboard objectives add mh.setting.frz dummy {"text":"\u00a7b设置冻结猎人时长","clickEvent": {"action": "suggest_command", "value": "/scoreboard players set @s mh.setting.frz "}}
scoreboard objectives add mh.temp dummy

# 其他
scoreboard objectives add mh.uid dummy
scoreboard objectives add mh.health health {"text":"❤","color":"red"}
scoreboard objectives add mh.died minecraft.custom:deaths
scoreboard objectives add mh.tracking.old dummy

execute unless score 已应用默认设置 mh.settings matches 1 run function mh:settings/default

execute as @a unless score @s mh.uid matches 0.. run tag @s remove has.uid

execute in minecraft:overworld run forceload add 29999984 29999984
execute in minecraft:overworld run setblock 29999985 254 29999984 shulker_box

bossbar add mh:freeze ""

function mh:keep_every_sec
function mh:keep_every_12t
