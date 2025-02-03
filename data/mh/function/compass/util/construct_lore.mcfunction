# executor: 指南针持有者
# args: in.guuid 在 mh:temp
# output: 在 mh:temp 的 loreText 储存指南针的tooltip文字

#  [{text:"正在追踪：",color:"gray", extra:[{selector:"61595d08-35f1..."}]},{text:"放到合成格中可手动编辑目标."},{text:"丢弃时触发："},{text:"  切换到下一个目标"}]
# data remove storage mh:temp loreText
data modify storage mh:temp loreText set value [{text:"正在追踪：",color:"gray", extra:[{selector:""}]},{text:"放到合成格中可手动编辑目标.",color:"blue"}]
# selector直接从in.guuid复制
data modify storage mh:temp loreText[0].extra[0].selector set from storage mh:temp in.guuid
# 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新
execute if score 追踪器:更新模式 mh.settings matches 0 run data modify storage mh:temp loreText[0].extra append value {text: " (右键更新)"}
execute if score 追踪器:更新模式 mh.settings matches 1 run data modify storage mh:temp loreText[0].extra append value {text: " (快捷栏更新)"}
execute if score 追踪器:更新模式 mh.settings matches 2 run data modify storage mh:temp loreText[0].extra append value {text: " (手持更新)"}
execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp loreText[0].extra append value {text: " (定期更新)"}
# 0:无动作 1:切换目标 2:转换为编辑模式 3:执行命令
execute if score 追踪器:丢弃时触发 mh.settings matches 1..3 run data modify storage mh:temp loreText append value {text:"丢弃时触发："}
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run data modify storage mh:temp loreText append value {text:"  切换到下一个目标"}
execute if score 追踪器:丢弃时触发 mh.settings matches 2 run data modify storage mh:temp loreText append value {text:"  手动编辑目标"}
execute if score 追踪器:丢弃时触发 mh.settings matches 3 run data modify storage mh:temp loreText append value {text:"  自定义命令"}

# 设置@s 的mh.lore.expand分数，若可为1以上则物品修饰器copy_data_and_lore会显示额外信息
function mh:compass/util/filter_my_trackable
execute store result score @s mh.lore.expand if entity @a[tag=mh.trackable]
scoreboard players remove @s mh.lore.expand 1
tag @a remove mh.trackable

