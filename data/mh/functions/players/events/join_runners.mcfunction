execute unless score 允许自由选队 mh.settings matches 0 run team leave @s
execute unless score 允许自由选队 mh.settings matches 0 run team join runners @s
execute if score 允许自由选队 mh.settings matches 0 run tellraw @s "\u00a7c系统设置不允许自由选队, 请使用/team join [队伍] [玩家名字]"
scoreboard players set @s mh.join.runners 0
