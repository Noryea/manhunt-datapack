scoreboard players add 追踪器:丢弃时触发 mh.settings 1
execute unless score 追踪器:丢弃时触发 mh.settings matches 0..2 run scoreboard players set 追踪器:丢弃时触发 mh.settings 0
# 更新物品名称
execute as @a run function mh:compass/refresh/inventory_iteminfo_only

# play ui sound
playsound ui.button.click record @s
# show setting menu
function #mh:menu