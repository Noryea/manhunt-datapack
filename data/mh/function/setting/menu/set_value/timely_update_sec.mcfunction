## @args {Value: int}

# 
$scoreboard players set 追踪器:定期更新周期秒数 mh.settings $(Value)
scoreboard players set 定期更新倒计时 mh.temp 1

# bossbar最大值（需要Value大于等于1）
$bossbar set mh:compass_timer max $(Value)

# 马上重新运行
execute if score 追踪器:定期更新周期秒数 mh.settings matches 1.. run \
    schedule function mh:schedule_task/keep_update 1t replace

# 重新显示设置菜单
function #mh:menu