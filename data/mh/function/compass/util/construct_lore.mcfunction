# executor: 指南针持有者
# args: in.guuid 在 mh:temp
# output: 在 mh:temp 的 loreText 储存指南针的tooltip文字
#  [{text:"正在追踪：",color:"gray", extra:[{selector:"61595d08-35f1..."}]},{text:"放到合成格中可手动编辑目标."},{text:"丢弃时触发："},{text:"  切换到下一个目标"}]

# data remove storage mh:temp loreText
execute unless data storage mh:temp loreText run \
    data modify storage mh:temp loreText set value [{text:"正在追踪：",color:"gray", extra:[{selector:""}]},{},{text:"放到合成格中可编辑目标.",color:"blue"},{text:"丢弃时触发："},{}]
# selector直接从in.guuid复制
data modify storage mh:temp loreText[0].extra[0].selector set from storage mh:temp in.guuid

# 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新
execute if score 追踪器:更新模式 mh.settings matches 0 run data modify storage mh:temp loreText[1] set value {text: "(右键更新位置)", color: "gray"}
execute if score 追踪器:更新模式 mh.settings matches 1 run data modify storage mh:temp loreText[1] set value {text: "(快捷栏更新位置)", color: "gray"}
execute if score 追踪器:更新模式 mh.settings matches 2 run data modify storage mh:temp loreText[1] set value {text: "(手持更新位置)", color: "gray"}
execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp loreText[1] set value {text: "(定期更新位置)", color: "gray"}
# 0:无动作 1:切换目标 2:转换为编辑模式 3:执行命令
execute if score 追踪器:丢弃时触发 mh.settings matches 0 run data modify storage mh:temp loreText[4] append value {text:"  无",color:"blue"}
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run data modify storage mh:temp loreText[4] append value {text:"  切换到下一个目标",color:"blue"}
execute if score 追踪器:丢弃时触发 mh.settings matches 2 run data modify storage mh:temp loreText[4] append value {text:"  编辑目标",color:"blue"}
execute if score 追踪器:丢弃时触发 mh.settings matches 3 run data modify storage mh:temp loreText[4] append value {text:"  自定义命令",color:"blue"}