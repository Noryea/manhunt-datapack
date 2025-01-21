# ======追杀指南针数据包设置======
# 允许自由选队：[开启]
# 逃者死亡后：[旁观]
# 猎人可追踪：[队友][逃者]
# 逃者可追踪：[队友][猎人]
# 指南针显示敌人信息：[距离][XZ][Y][维度]
# 指南针显示队友信息：[距离][XZ][Y][维度]
# 指南针更新模式：[定期更新] 更新周期=1秒
# 指南针丢弃事件：[切换目标]
#

tellraw @s {"text":"======追杀数据包设置======","bold": true,"hoverEvent": {"action": "show_text","value": "by Noryea."}}

execute unless score 允许自由选队 mh.settings matches 1 run \
    tellraw @s ["允许玩家自由选队: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 允许自由选队 mh.settings 1\"}"}}]
execute if score 允许自由选队 mh.settings matches 1 run \
    tellraw @s ["允许玩家自由选队: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 允许自由选队 mh.settings 0\"}"}}]

execute unless score 逃者死亡后 mh.settings matches 1..2 run \
    tellraw @s ["逃者死亡后: ",{"text":"[复活]","color":"green","hoverEvent":{"action": "show_text","value":"逃者死亡时不做任何操作"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者死亡后 mh.settings 1\"}"}}]
execute if score 逃者死亡后 mh.settings matches 1 run \
    tellraw @s ["逃者死亡后: ",{"text":"[加入猎人]","color":"yellow","hoverEvent":{"action": "show_text","value":"逃者死亡时变成猎人"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者死亡后 mh.settings 2\"}"}}]
execute if score 逃者死亡后 mh.settings matches 2 run \
    tellraw @s ["逃者死亡后: ",{"text":"[旁观]","color":"white","hoverEvent":{"action": "show_text","value":"逃者死亡时变成旁观者"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者死亡后 mh.settings 0\"}"}}]


data modify storage mh:temp TextList set value ['','']
execute unless score 猎人可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[逃者]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 猎人可追踪:敌人 mh.settings 1\\"}" }}'
execute if score 猎人可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[逃者]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 猎人可追踪:敌人 mh.settings 0\\"}" }}'
execute unless score 猎人可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[队友]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 猎人可追踪:队友 mh.settings 1\\"}" }}'
execute if score 猎人可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[队友]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 猎人可追踪:队友 mh.settings 0\\"}" }}'
tellraw @s [ "\u00a7c猎人\u00a7r可追踪: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


data modify storage mh:temp TextList set value ['','']
execute unless score 逃者可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[猎人]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 逃者可追踪:敌人 mh.settings 1\\"}" }}'
execute if score 逃者可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[猎人]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 逃者可追踪:敌人 mh.settings 0\\"}" }}'
execute unless score 逃者可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[队友]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 逃者可追踪:队友 mh.settings 1\\"}" }}'
execute if score 逃者可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[队友]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 逃者可追踪:队友 mh.settings 0\\"}" }}'
tellraw @s [ "\u00a7a逃者\u00a7r可追踪: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


data modify storage mh:temp TextList set value ['','','','']
execute unless score 敌人追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[距离]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示距离 mh.settings 1\\"}" }}'
execute if score 敌人追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[距离]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示距离 mh.settings 0\\"}" }}'
execute unless score 敌人追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[XZ]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示XZ坐标 mh.settings 1\\"}" }}'
execute if score 敌人追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[XZ]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示XZ坐标 mh.settings 0\\"}" }}'
execute unless score 敌人追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value '{"text":"[Y]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示Y坐标 mh.settings 1\\"}" }}'
execute if score 敌人追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value '{"text":"[Y]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示Y坐标 mh.settings 0\\"}" }}'
execute unless score 敌人追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value '{"text":"[维度]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示维度 mh.settings 1\\"}" }}'
execute if score 敌人追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value '{"text":"[维度]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 敌人追踪器:显示维度 mh.settings 0\\"}" }}'
tellraw @s [ "指南针显示敌人信息: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[2]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[3]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


data modify storage mh:temp TextList set value ['','','','']
execute unless score 队友追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[距离]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示距离 mh.settings 1\\"}" }}'
execute if score 队友追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value '{"text":"[距离]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示距离 mh.settings 0\\"}" }}'
execute unless score 队友追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[XZ]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示XZ坐标 mh.settings 1\\"}" }}'
execute if score 队友追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value '{"text":"[XZ]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示XZ坐标 mh.settings 0\\"}" }}'
execute unless score 队友追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value '{"text":"[Y]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示Y坐标 mh.settings 1\\"}" }}'
execute if score 队友追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value '{"text":"[Y]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示Y坐标 mh.settings 0\\"}" }}'
execute unless score 队友追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value '{"text":"[维度]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示维度 mh.settings 1\\"}" }}'
execute if score 队友追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value '{"text":"[维度]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\\"scoreboard players set 队友追踪器:显示维度 mh.settings 0\\"}" }}'
tellraw @s [ "指南针显示队友信息: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[2]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[3]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]

execute unless score 追踪器:更新模式 mh.settings matches 1..2 run \
    tellraw @s ["指南针更新模式: ",{"text":"[定期更新]","color":"green","hoverEvent":{"action": "show_text","value":"定期更新玩家背包中所有指南针"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:更新模式 mh.settings 1\"}"}}, \
  "  更新周期=", {"score": { "objective": "mh.settings", "name": "追踪器:定期更新周期秒数" }, "color": "green", "underlined": true, "hoverEvent":{"action": "show_text","value":"(最少设置成1秒)"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/auto_update_delay_sec {Value: \"请输入\"}"}},{"text": "秒", "color": "green"}]
execute if score 追踪器:更新模式 mh.settings matches 1 run \
    tellraw @s ["指南针更新模式: ",{"text":"[手持更新]","color":"green","hoverEvent":{"action": "show_text","value":"只有玩家手持指南针才能更新"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:更新模式 mh.settings 2\"}"}}]
execute if score 追踪器:更新模式 mh.settings matches 2 run \
    tellraw @s ["指南针更新模式: ",{"text":"[右键更新(*需1.21.2+)]","color":"yellow","hoverEvent":{"action": "show_text","value":"让指南针变成可使用物品，需要玩家手动更新"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:更新模式 mh.settings 0\"}"}}, \
  "  使用冷却=", {"score": { "objective": "mh.settings", "name": "追踪器:右键更新周期游戏刻" }, "color": "green", "underlined": true, "hoverEvent":{"action": "show_text","value":"(可修改成任意整数,0表示无冷却)"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/use_delay {Value: \"请输入\"}"}},{"text": "ticks", "color": "green"}]

execute unless score 追踪器:更新模式 mh.settings matches 1..2 \
    unless score 追踪器:定期更新计时器bossBar mh.settings matches 1 run \
    tellraw @s ["显示定期更新倒计时BOSS条: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:定期更新计时器bossBar mh.settings 1\"}"}}]
execute unless score 追踪器:更新模式 mh.settings matches 1..2 \
    if score 追踪器:定期更新计时器bossBar mh.settings matches 1 run \
    tellraw @s ["显示定期更新倒计时BOSS条: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:定期更新计时器bossBar mh.settings 0\"}"}}]
#渲染删除线
execute if score 追踪器:更新模式 mh.settings matches 1..2 run \
    tellraw @s {"text":"显示定期更新倒计时BOSS条: []","color": "gray","strikethrough": true}

execute unless score 追踪器:丢弃时触发 mh.settings matches 1..3 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[无动作]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:丢弃时触发 mh.settings 1\"}"}}]
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[切换目标]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:丢弃时触发 mh.settings 2\"}"}}]
execute if score 追踪器:丢弃时触发 mh.settings matches 2 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[手动指定目标]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:丢弃时触发 mh.settings 3\"}"}}]
execute if score 追踪器:丢弃时触发 mh.settings matches 3 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[自定义命令]","color":"yellow","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:丢弃时触发 mh.settings 0\"}"}}]


tellraw @s {"text":"[清空玩家状态]","color":"yellow","hoverEvent": {"action": "show_text","value":"重置所有玩家的血量、背包、重生点、进度和配方"},"clickEvent": {"action": "suggest_command","value": ""}}

tellraw @s ""