# ======追杀指南针数据包设置======
# 允许自由选队：[开启]
# 逃者死亡后：[旁观]
# 猎人可追踪：[队友][逃者]
# 逃者可追踪：[队友][猎人]
# 指南针丢弃事件：[切换目标]
# 指南针显示敌人信息：[距离][XZ][Y][维度]
# 指南针显示队友信息：[距离][XZ][Y][维度]
# 指南针更新模式：[定期更新] 更新周期=1秒
# 

tellraw @s {"text":"","bold": true,"hoverEvent": {"action": "show_text","value": "Made by Noryea"},"extra": [{"text":"=","color":"#e796d0"},{"text":"=","color":"#e09aca"},{"text":"=","color":"#d99dc5"},{"text":"=","color":"#d1a1bf"},{"text":"=","color":"#caa4b9"},{"text":"=","color":"#c3a8b4"},{"text":"追","color":"#bcacae"},{"text":"杀","color":"#b4afa8"},{"text":"数","color":"#adb3a3"},{"text":"据","color":"#a6b79d"},{"text":"包","color":"#9fba97"},{"text":"设","color":"#98be92"},{"text":"置","color":"#90c18c"},{"text":"=","color":"#89c586"},{"text":"=","color":"#82c981"},{"text":"=","color":"#7bcc7b"},{"text":"=","color":"#73d075"},{"text":"=","color":"#6cd370"},{"text":"=","color":"#65d76a"}]}

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


data modify storage mh:temp TextList set value [{},{}]
execute unless score 猎人可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[逃者]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 猎人可追踪:敌人 mh.settings 1\"}" }}
execute if score 猎人可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[逃者]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 猎人可追踪:敌人 mh.settings 0\"}" }}
execute unless score 猎人可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[队友]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 猎人可追踪:队友 mh.settings 1\"}" }}
execute if score 猎人可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[队友]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 猎人可追踪:队友 mh.settings 0\"}" }}
tellraw @s [ "\u00a7c猎人\u00a7r可追踪: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


data modify storage mh:temp TextList set value [{},{}]
execute unless score 逃者可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[猎人]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者可追踪:敌人 mh.settings 1\"}" }}
execute if score 逃者可追踪:敌人 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[猎人]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者可追踪:敌人 mh.settings 0\"}" }}
execute unless score 逃者可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[队友]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者可追踪:队友 mh.settings 1\"}" }}
execute if score 逃者可追踪:队友 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[队友]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 逃者可追踪:队友 mh.settings 0\"}" }}
tellraw @s [ "\u00a7a逃者\u00a7r可追踪: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


execute unless score 追踪器:丢弃时触发 mh.settings matches 1..2 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[无动作]","color":"gray","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"function mh:setting/menu/set_value/switch_drop_event\"}"}}]
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[切换目标]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"function mh:setting/menu/set_value/switch_drop_event\"}"}}]
execute if score 追踪器:丢弃时触发 mh.settings matches 2 run \
    tellraw @s ["指南针丢弃事件: ",{"text":"[手动指定目标]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"function mh:setting/menu/set_value/switch_drop_event\"}"}}]


data modify storage mh:temp TextList set value [{},{},{},{}]
execute unless score 敌人追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[距离]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示距离 mh.settings 1\"}" }}
execute if score 敌人追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[距离]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示距离 mh.settings 0\"}" }}
execute unless score 敌人追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[XZ]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示XZ坐标 mh.settings 1\"}" }}
execute if score 敌人追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[XZ]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示XZ坐标 mh.settings 0\"}" }}
execute unless score 敌人追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value {"text":"[Y]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示Y坐标 mh.settings 1\"}" }}
execute if score 敌人追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value {"text":"[Y]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示Y坐标 mh.settings 0\"}" }}
execute unless score 敌人追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value {"text":"[维度]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示维度 mh.settings 1\"}" }}
execute if score 敌人追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value {"text":"[维度]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 敌人追踪器:显示维度 mh.settings 0\"}" }}
tellraw @s [ "显示敌人信息: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[2]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[3]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


data modify storage mh:temp TextList set value [{},{},{},{}]
execute unless score 队友追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[距离]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示距离 mh.settings 1\"}" }}
execute if score 队友追踪器:显示距离 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[0] set value {"text":"[距离]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示距离 mh.settings 0\"}" }}
execute unless score 队友追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[XZ]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示XZ坐标 mh.settings 1\"}" }}
execute if score 队友追踪器:显示XZ坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[1] set value {"text":"[XZ]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示XZ坐标 mh.settings 0\"}" }}
execute unless score 队友追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value {"text":"[Y]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示Y坐标 mh.settings 1\"}" }}
execute if score 队友追踪器:显示Y坐标 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[2] set value {"text":"[Y]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示Y坐标 mh.settings 0\"}" }}
execute unless score 队友追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value {"text":"[维度]", "color":"gray", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示维度 mh.settings 1\"}" }}
execute if score 队友追踪器:显示维度 mh.settings matches 1 run \ 
    data modify storage mh:temp TextList[3] set value {"text":"[维度]", "color":"green", "clickEvent":{"action":"run_command", \ 
    "value": "/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 队友追踪器:显示维度 mh.settings 0\"}" }}
tellraw @s [ "显示队友信息: ", \
    {"nbt":"TextList[0]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[1]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[2]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}, \
    {"nbt":"TextList[3]","storage":"mh:temp","interpret":true,"hoverEvent":{"action":"show_text","value":"点击切换"}}\ 
]


execute unless score 追踪器:更新模式 mh.settings matches 1..3 run \
    tellraw @s ["指南针更新模式: ",{"text":"[右键更新(需1.21.2+)]","color":"aqua","hoverEvent":{"action": "show_text","value":"让指南针变成可使用物品，需要玩家手动更新"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/set_value/switch_refresh_mode"}}, \
  "  使用冷却=", {"score": { "objective": "mh.settings", "name": "追踪器:右键更新周期游戏刻" }, "color": "aqua", "underlined": true, "hoverEvent":{"action": "show_text","value":"可修改成0~200(默认30, 0表示无冷却)"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/use_delay {Value: \"请输入\"}"}},{"text": "刻", "color": "aqua"}]
execute if score 追踪器:更新模式 mh.settings matches 1 run \
    tellraw @s ["指南针更新模式: ",{"text":"[快捷栏更新]","color":"green","hoverEvent":{"action": "show_text","value":"自动更新玩家快捷栏中所有指南针"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/set_value/switch_refresh_mode"}}, \
  "  更新周期=", {"score": { "objective": "mh.settings", "name": "追踪器:快捷栏更新周期游戏刻" }, "color": "green", "underlined": true, "hoverEvent":{"action": "show_text","value":"可修改成1~60(默认10)"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/hotbar_update_delay {Value: \"请输入\"}"}},{"text": "刻", "color": "green"}]
execute if score 追踪器:更新模式 mh.settings matches 2 run \
    tellraw @s ["指南针更新模式: ",{"text":"[手持更新]","color":"green","hoverEvent":{"action": "show_text","value":"只有玩家手持指南针时才更新"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/set_value/switch_refresh_mode"}}, \
  "  更新周期=", {"score": { "objective": "mh.settings", "name": "追踪器:手持更新周期游戏刻" }, "color": "green", "underlined": true, "hoverEvent":{"action": "show_text","value":"可修改成1~60(默认10)"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/hand_update_delay {Value: \"请输入\"}"}},{"text": "刻", "color": "green"}]
execute if score 追踪器:更新模式 mh.settings matches 3 run \
    tellraw @s ["指南针更新模式: ",{"text":"[定期更新]","color":"yellow","hoverEvent":{"action": "show_text","value":"定期更新玩家背包中所有指南针"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/set_value/switch_refresh_mode"}}, \
  "  更新周期=", {"score": { "objective": "mh.settings", "name": "追踪器:定期更新周期秒数" }, "color": "yellow", "underlined": true, "hoverEvent":{"action": "show_text","value":"可修改为任意正整数"},"clickEvent":{"action":"suggest_command","value":"/function mh:setting/menu/set_value/timely_update_sec {Value: \"请输入\"}"}},{"text": "秒", "color": "yellow"}]


execute if score 追踪器:更新模式 mh.settings matches 2 \
    unless score 追踪器:手持激活模式 mh.settings matches 1 run \
    tellraw @s [" 指南针必须手持激活: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:手持激活模式 mh.settings 1\"}"}}]
execute if score 追踪器:更新模式 mh.settings matches 2 \
    if score 追踪器:手持激活模式 mh.settings matches 1 run \
    tellraw @s [" 指南针必须手持激活: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:手持激活模式 mh.settings 0\"}"}}]
execute if score 追踪器:更新模式 mh.settings matches 3 \
    unless score 追踪器:定期更新计时器bossBar mh.settings matches 1 run \
    tellraw @s [" 显示定期更新倒计时BOSS条: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:定期更新计时器bossBar mh.settings 1\"}"}}]
execute if score 追踪器:更新模式 mh.settings matches 3 \
    if score 追踪器:定期更新计时器bossBar mh.settings matches 1 run \
    tellraw @s [" 显示定期更新倒计时BOSS条: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:setting/menu/show_post_executing {Command:\"scoreboard players set 追踪器:定期更新计时器bossBar mh.settings 0\"}"}}]
execute unless score 追踪器:更新模式 mh.settings matches 2 unless score 追踪器:更新模式 mh.settings matches 3 run \
    tellraw @s ""

tellraw @s [{"text":"[冻结猎人..]","color":"#b3ffff","hoverEvent": {"action": "show_text","value":"/function #mh:set_freeze {Value:<秒数>}"},"clickEvent": {"action": "suggest_command","value": "/function #mh:set_freeze {Value:\"请输入\"}"}}, \
    "",\
    {"text":"[清空玩家状态]","color":"yellow","hoverEvent": {"action": "show_text","value":"重置所有玩家的血量、背包、重生点、进度和配方"},"clickEvent": {"action": "suggest_command","value": "/function mh:setting/menu/recover_all"}}]

tellraw @s ""
data remove storage mh:temp TextList