function mh:settings/menu/no_sendback
tellraw @a ["\u00a77[",{"selector":"@s"},"\u00a77] ",{"text":"已清空所有玩家的状态","color":"white","hoverEvent": {"action": "show_text","value":"重置所有玩家的血量、背包、重生点、进度和配方"},"clickEvent": {"action": "suggest_command","value": "/function #mh:recover_all"}}]

advancement revoke @a everything
recipe take @a *
xp add @a -1000000000 levels
clear @a
loot replace entity @a enderchest.0 27 loot empty
execute in minecraft:the_nether run spawnpoint @a 0 0 0
effect clear @a

effect give @a hunger 3 143 true
effect give @a saturation 2 255 true
effect give @a instant_health 1 124 true

scoreboard players reset @s mh.pos.x.1
scoreboard players reset @s mh.pos.y.1
scoreboard players reset @s mh.pos.z.1
scoreboard players reset @s mh.pos.x.0
scoreboard players reset @s mh.pos.y.0
scoreboard players reset @s mh.pos.z.0
scoreboard players reset @s mh.pos.x.-1
scoreboard players reset @s mh.pos.y.-1
scoreboard players reset @s mh.pos.z.-1