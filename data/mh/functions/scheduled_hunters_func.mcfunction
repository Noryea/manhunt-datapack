#> 对猎人函数的执行进行调度, 尽可能避免在同一刻内执行
# 这在猎人数量大于7的情况下, 对tps提升显著

# 挑取2名带hunter标签的玩家
execute unless score #schedule_h_times mh.temp matches 10.. run tag @a[tag=mh.hunter,limit=2,sort=arbitrary] add mh.executing
execute if score #schedule_h_times mh.temp matches 10.. run tag @a[tag=mh.hunter] add mh.executing
# 对这两名玩家执行猎人函数
execute as @a[tag=mh.executing] at @s run function mh:players/hunters/main
# 移除hunter标签
tag @a[tag=mh.executing] remove mh.hunter
tag @a[tag=mh.executing] remove mh.executing

# 下一刻又执行
scoreboard players add #schedule_h_times mh.temp 1
execute if entity @a[tag=mh.hunter] run schedule function mh:scheduled_hunters_func 1t