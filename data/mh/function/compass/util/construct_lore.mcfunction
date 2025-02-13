# @executor: 指南针持有者
# @args: in.guuid 在 mh:temp
# @output: 在 mh:temp 的 itemInfoText 储存指南针的tooltip文字
#  [{text:"正在追踪：",color:"gray", extra:[{selector:"61595d08-35f1..."}]},{text:"丢弃时触发："},{text:"  切换到下一个目标"}]

# data remove storage mh:temp itemInfoText
execute unless data storage mh:temp itemInfoText run \
    data modify storage mh:temp itemInfoText set value [{text:"追踪器",color:"white"},{text:"正在追踪: ",color:"white", extra:[{selector:""}]},{text:"丢弃时触发：", color: "gray"},{}]
# selector直接从in.guuid复制
data modify storage mh:temp itemInfoText[1] set value {text:"正在追踪: ",color:"white", extra:[{selector:""}]}
data modify storage mh:temp itemInfoText[1].extra[0].selector set from storage mh:temp in.guuid
execute unless data storage mh:temp in.guuid run data modify storage mh:temp itemInfoText[1].extra set value [{text:"未知",color:"gray"}]

# ====以下命令转到keep_update.mcfunction中运行
# # 0:右键更新 1:快捷栏更新 2:手持更新 3:定期更新
# execute if score 追踪器:更新模式 mh.settings matches 0 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (右键更新)", color: "gray"}]
# execute if score 追踪器:更新模式 mh.settings matches 1 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (快捷栏更新)", color: "gray"}]
# execute if score 追踪器:更新模式 mh.settings matches 2 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (手持更新)", color: "gray"}]
# execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp itemInfoText[0].extra set value [{text: " (", color: "gray"},{score: {name: "定期更新倒计时",objective: "mh.temp"},color: "yellow"}, {text: "秒后更新)",color:"gray"}]
# # 0:无动作 1:切换目标 2:转换为编辑模式 3:执行命令
# execute if score 追踪器:丢弃时触发 mh.settings matches 0 run data modify storage mh:temp itemInfoText[3] set value {text:"  无动作",color:"gray"}
# execute if score 追踪器:丢弃时触发 mh.settings matches 1 run data modify storage mh:temp itemInfoText[3] set value {text:"  选择下一个目标",color:"gray"}
# execute if score 追踪器:丢弃时触发 mh.settings matches 2 run data modify storage mh:temp itemInfoText[3] set value {text:"  手动输入追踪目标",color:"gray"}
