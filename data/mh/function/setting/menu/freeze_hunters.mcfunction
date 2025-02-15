## @args {Value: int}

#
$scoreboard players set 猎人冻结倒计时 mh.temp $(Value)

# bossbar最大值（需要Value大于等于1）
$bossbar set mh:freeze max $(Value)

# 马上运行freeze函数
schedule function mh:schedule_task/keep_freeze 1t replace

# 播放音效
execute as @a[team=hunters] at @s run playsound block.stone.place record @s ~ ~ ~ 0.9 0.8 0.9