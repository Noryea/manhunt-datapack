scoreboard players add 追踪器:更新模式 mh.settings 1
execute unless score 追踪器:更新模式 mh.settings matches 0..3 run scoreboard players set 追踪器:更新模式 mh.settings 0
# inventory refresh
execute as @a at @s run function mh:compass/refresh/inventory
# play ui sound
playsound ui.button.click record @s
# show setting menu
function #mh:menu