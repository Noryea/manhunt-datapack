# =========默认设置=========
team modify hunters friendlyFire true
team modify hunters collisionRule always
team modify hunters nametagVisibility always
team modify hunters color red

team modify runners friendlyFire true
team modify runners collisionRule always
team modify runners nametagVisibility always
team modify runners color green

##
scoreboard players set 允许自由选队 mh.settings 1
##  0:复活 1:加入猎人 2:旁观
scoreboard players set 逃者死亡后 mh.settings 2


##
scoreboard players set 猎人可追踪:敌人 mh.settings 1
##
scoreboard players set 猎人可追踪:队友 mh.settings 0
##
scoreboard players set 逃者可追踪:敌人 mh.settings 0
##
scoreboard players set 逃者可追踪:队友 mh.settings 0


##
scoreboard players set 敌人追踪器:显示距离 mh.settings 0
##
scoreboard players set 敌人追踪器:显示XZ坐标 mh.settings 0
##
scoreboard players set 敌人追踪器:显示Y坐标 mh.settings 0
##
scoreboard players set 敌人追踪器:显示维度 mh.settings 0


##
scoreboard players set 队友追踪器:显示距离 mh.settings 1
##
scoreboard players set 队友追踪器:显示XZ坐标 mh.settings 0
##
scoreboard players set 队友追踪器:显示Y坐标 mh.settings 0
##
scoreboard players set 队友追踪器:显示维度 mh.settings 1


##  0:右键更新 1:手持更新 2:定期更新
scoreboard players set 追踪器:更新模式 mh.settings 0
##
scoreboard players set 追踪器:定期更新周期秒数 mh.settings 1
##
scoreboard players set 追踪器:右键更新周期游戏刻 mh.settings 12
##
scoreboard players set 追踪器:定期更新计时器bossBar mh.settings 0
##  0:无动作 1:切换目标 2:转换为编辑模式 3:执行命令
scoreboard players set 追踪器:丢弃时触发 mh.settings 1





scoreboard players set 已应用默认设置 mh.settings 1