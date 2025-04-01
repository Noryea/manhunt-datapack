# 每秒执行
schedule function mh:schedule_task/every_sec 1s replace

advancement grant @a only mh:detect/inventory_changed pt20
execute as @a at @s run function mh:player/every_sec