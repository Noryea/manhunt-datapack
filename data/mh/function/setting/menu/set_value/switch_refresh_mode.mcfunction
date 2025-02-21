scoreboard players add 追踪器:更新模式 mh.settings 1
execute unless score 追踪器:更新模式 mh.settings matches 0..3 run scoreboard players set 追踪器:更新模式 mh.settings 0

execute as @a run function mh:compass/refresh/inventory

# 如果是定期更新,重置更新倒计时
scoreboard players set 定期更新倒计时 mh.temp 1
# play ui sound
playsound ui.button.click record @s
# show setting menu
function #mh:menu