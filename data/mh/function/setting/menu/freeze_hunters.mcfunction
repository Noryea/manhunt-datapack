## @args {Value: int}

# 假设值合法
$scoreboard players set 猎人冻结倒计时 mh.temp $(Value)

# bossbar最大值
$bossbar set mh:freeze max $(Value)

# 马上运行freeze函数
schedule function mh:schedule_task/keep_freeze 1t replace