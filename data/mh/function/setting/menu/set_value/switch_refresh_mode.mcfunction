scoreboard players add 追踪器:更新模式 mh.settings 1
execute unless score 追踪器:更新模式 mh.settings matches 0..3 run scoreboard players set 追踪器:更新模式 mh.settings 0
# 更新物品名称
# execute as @a at @s run function mh:compass/refresh/inventory
# 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新
execute if score 追踪器:更新模式 mh.settings matches 0 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (右键更新)", color: "gray"}]
execute if score 追踪器:更新模式 mh.settings matches 1 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (快捷栏更新)", color: "gray"}]
execute if score 追踪器:更新模式 mh.settings matches 2 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (手持更新)", color: "gray"}]
execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (", color: "gray"},{score: {name: "定期更新倒计时",objective: "mh.temp"},color: "yellow"}, {text: "秒后更新)",color:"gray"}]

execute as @a run function mh:compass/refresh/inventory_lore_only

# play ui sound
playsound ui.button.click record @s
# show setting menu
function #mh:menu