scoreboard players add 追踪器:丢弃时触发 mh.settings 1
execute unless score 追踪器:丢弃时触发 mh.settings matches 0..2 run scoreboard players set 追踪器:丢弃时触发 mh.settings 0
# 更新物品名称
# execute as @a at @s run function mh:compass/refresh/inventory
# 0:无动作 1:切换目标 2:转换为编辑模式 3:执行命令
execute if score 追踪器:丢弃时触发 mh.settings matches 0 run data modify storage mh:temp itemInfoText[3] set value {text:"  无动作",color:"gray"}
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run data modify storage mh:temp itemInfoText[3] set value {text:"  选择下一个目标",color:"gray"}
execute if score 追踪器:丢弃时触发 mh.settings matches 2 run data modify storage mh:temp itemInfoText[3] set value {text:"  手动输入追踪目标",color:"gray"}

execute as @a run function mh:compass/refresh/inventory_lore_only

# play ui sound
playsound ui.button.click record @s
# show setting menu
function #mh:menu