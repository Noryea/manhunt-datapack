tellraw @a ["\u00a77[",{"selector":"@s"},"\u00a77] ",{"text":"已清空所有玩家的状态","color":"white","hoverEvent": {"action": "show_text","value":"重置所有玩家的血量、背包、重生点、进度和配方"},"clickEvent": {"action": "suggest_command","value": "/function #mh:recover_all"}}]

advancement revoke @a everything
recipe take @a *
xp add @a -1000000000 levels
clear @a
item replace entity @a enderchest.0 with air
item replace entity @a enderchest.1 with air
item replace entity @a enderchest.2 with air
item replace entity @a enderchest.3 with air
item replace entity @a enderchest.4 with air
item replace entity @a enderchest.5 with air
item replace entity @a enderchest.6 with air
item replace entity @a enderchest.7 with air
item replace entity @a enderchest.8 with air
item replace entity @a enderchest.9 with air
item replace entity @a enderchest.10 with air
item replace entity @a enderchest.11 with air
item replace entity @a enderchest.12 with air
item replace entity @a enderchest.13 with air
item replace entity @a enderchest.14 with air
item replace entity @a enderchest.15 with air
item replace entity @a enderchest.16 with air
item replace entity @a enderchest.17 with air
item replace entity @a enderchest.18 with air
item replace entity @a enderchest.19 with air
item replace entity @a enderchest.20 with air
item replace entity @a enderchest.21 with air
item replace entity @a enderchest.22 with air
item replace entity @a enderchest.23 with air
item replace entity @a enderchest.24 with air
item replace entity @a enderchest.25 with air
item replace entity @a enderchest.26 with air
execute in minecraft:the_nether run spawnpoint @a 0 0 0
effect clear @a

effect give @a hunger 3 143 true
effect give @a saturation 2 255 true
effect give @a instant_health 1 124 true