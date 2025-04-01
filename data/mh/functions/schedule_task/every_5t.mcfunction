# 每秒执行
schedule function mh:schedule_task/every_5t 5t replace

advancement grant @a only mh:detect/inventory_changed pt5
execute as @a at @s run function mh:player/show_actionbar