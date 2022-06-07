function mh:settings/menu/no_sendback
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

tellraw @s {"text":"======追杀数据包设置======","bold": true,"hoverEvent": {"action": "show_text","value": "by Noryea."}}

execute if score 允许自由选队 mh.settings matches 1 run tellraw @s ["允许玩家自由选队: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/freely_join"}}]
execute unless score 允许自由选队 mh.settings matches 1 run tellraw @s ["允许玩家自由选队: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/freely_join"}}]

execute if score 逃者发光 mh.settings matches 1 run tellraw @s ["逃者永久发光: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_glow"}}]
execute unless score 逃者发光 mh.settings matches 1 run tellraw @s ["逃者永久发光: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_glow"}}]

execute if score 逃者死亡后 mh.settings matches 2 run tellraw @s ["逃者死亡后: ",{"text":"[旁观]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_die_event"}}]
execute if score 逃者死亡后 mh.settings matches 1 run tellraw @s ["逃者死亡后: ",{"text":"[加入猎人]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_die_event"}}]
execute unless score 逃者死亡后 mh.settings matches 1..2 run tellraw @s ["逃者死亡后: ",{"text":"[复活]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_die_event"}}]

execute if score 可追踪队友 mh.settings matches 1 run tellraw @s ["可追踪队友: ",{"text":"[开启]","color":"green","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/can_track_teammates"}}]
execute unless score 可追踪队友 mh.settings matches 1 run tellraw @s ["可追踪队友: ",{"text":"[关闭]","color":"red","hoverEvent":{"action": "show_text","value":"点击切换"},"clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/can_track_teammates"}}]

data merge storage mh:temp {TextCompound:['','','']}
execute unless score 逃者:显示Y坐标 mh.settings matches 1..2 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_y"},"hoverEvent":{"action":"show_text","value":"点击切换"}}'
execute if score 逃者:显示Y坐标 mh.settings matches 1 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"aqua","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_y"},"hoverEvent":{"action":"show_text","value":"仅跨维度(点击切换)"}}'
execute if score 逃者:显示Y坐标 mh.settings matches 2 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_y"},"hoverEvent":{"action":"show_text","value":"总是(点击切换)"}}'
execute unless score 逃者:显示维度 mh.settings matches 1 run data modify storage mh:temp TextCompound[1] set value '{"text":"[维度]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_dimension"}}'
execute if score 逃者:显示维度 mh.settings matches 1 run data modify storage mh:temp TextCompound[1] set value '{"text":"[维度]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_dimension"}}'
execute unless score 逃者:显示距离 mh.settings matches 1 run data modify storage mh:temp TextCompound[2] set value '{"text":"[距离]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_distance"}}'
execute if score 逃者:显示距离 mh.settings matches 1 run data modify storage mh:temp TextCompound[2] set value '{"text":"[距离]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/runner_info/show_distance"}}'
tellraw @s ["逃者显示信息: ",{"nbt":"TextCompound[0]","storage":"mh:temp","interpret":true},{"nbt":"TextCompound[1]","storage":"mh:temp","hoverEvent":{"action":"show_text","value":"点击切换"},"interpret":true},{"nbt":"TextCompound[2]","storage":"mh:temp","hoverEvent":{"action":"show_text","value":"点击切换"},"interpret":true}]
data remove storage mh:temp TextCompound

data merge storage mh:temp {TextCompound:['','','']}
execute unless score 队友:显示Y坐标 mh.settings matches 1..2 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_y"},"hoverEvent":{"action":"show_text","value":"点击切换"}}'
execute if score 队友:显示Y坐标 mh.settings matches 1 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"aqua","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_y"},"hoverEvent":{"action":"show_text","value":"仅跨维度(点击切换)"}}'
execute if score 队友:显示Y坐标 mh.settings matches 2 run data modify storage mh:temp TextCompound[0] set value '{"text":"[Y坐标]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_y"},"hoverEvent":{"action":"show_text","value":"总是(点击切换)"}}'
execute unless score 队友:显示维度 mh.settings matches 1 run data modify storage mh:temp TextCompound[1] set value '{"text":"[维度]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_dimension"}}'
execute if score 队友:显示维度 mh.settings matches 1 run data modify storage mh:temp TextCompound[1] set value '{"text":"[维度]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_dimension"}}'
execute unless score 队友:显示距离 mh.settings matches 1 run data modify storage mh:temp TextCompound[2] set value '{"text":"[距离]","color":"gray","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_distance"}}'
execute if score 队友:显示距离 mh.settings matches 1 run data modify storage mh:temp TextCompound[2] set value '{"text":"[距离]","color":"green","clickEvent":{"action":"run_command","value":"/function mh:settings/menu/click_events/switch/teammate_info/show_distance"}}'
execute if score 可追踪队友 mh.settings matches 1 run tellraw @s ["队友显示信息: ",{"nbt":"TextCompound[0]","storage":"mh:temp","interpret":true},{"nbt":"TextCompound[1]","storage":"mh:temp","hoverEvent":{"action":"show_text","value":"点击切换"},"interpret":true},{"nbt":"TextCompound[2]","storage":"mh:temp","hoverEvent":{"action":"show_text","value":"点击切换"},"interpret":true}]
execute unless score 可追踪队友 mh.settings matches 1 run tellraw @s ""
data remove storage mh:temp TextCompound


tellraw @s {"text":"[冻结猎人..]","color":"aqua","hoverEvent": {"action": "show_text","value":"请输入一个1-100的整数(单位:秒)后回车"},"clickEvent": {"action": "suggest_command","value": "/scoreboard players set @s mh.setting.frz "}}
tellraw @s {"text":"[清空玩家状态]","color":"yellow","hoverEvent": {"action": "show_text","value":"重置所有玩家的血量、背包、重生点、进度和配方"},"clickEvent": {"action": "suggest_command","value": "/function #mh:recover_all"}}

tellraw @s ""