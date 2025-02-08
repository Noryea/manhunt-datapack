team add hunters "猎人"
team add runners "逃者"

# settings
scoreboard objectives add mh.settings dummy
execute unless score 已应用默认设置 mh.settings matches 1 run function mh:setting/default_setting


# triggers
scoreboard objectives add mh.join.hunters trigger {"text":"加入猎人","color":"red","clickEvent":{"action":"suggest_command","value":"/trigger mh.join.hunters"}}
scoreboard objectives add mh.join.runners trigger {"text":"加入逃者","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger mh.join.runners"}}


# 其他
scoreboard objectives add mh.temp dummy
scoreboard objectives add mh.died.listener minecraft.custom:deaths
scoreboard objectives add mh.pdb.querytime dummy
bossbar add mh:compass_timer ""
bossbar set mh:compass_timer color yellow
bossbar add mh:freeze ""


# 计划任务
schedule function mh:schedule_task/keep_every_sec 1s replace
schedule function mh:schedule_task/keep_update 1t replace