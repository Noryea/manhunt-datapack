execute unless score 允许自由选队 mh.settings matches 0 run tellraw @s ["选择队伍：",{"text":"[猎人]","color":"red","clickEvent":{"action":"run_command","value":"/trigger mh.join.hunters"},"hoverEvent":{"action":"show_text","value":{"text":"跟随指南针杀死逃者"}}},"\u00a7r, ",{"text":"[逃者]","color":"green","clickEvent":{"action":"run_command","value":"/trigger mh.join.runners"},"hoverEvent":{"action":"show_text","value":{"text":"在猎人的追杀下生存"}}}]
execute if score 允许自由选队 mh.settings matches 0 run tellraw @s "\u00a7c系统设置不允许自由选队, 请使用/team join [队伍] [玩家名字]"
scoreboard players set @s mh.join 0
