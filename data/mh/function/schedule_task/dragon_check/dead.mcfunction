# 标记末影龙已死亡，UUID 失效
scoreboard players set 末影龙UUID有效 mh.temp 0
scoreboard players set 末影龙已死亡 mh.temp 1
# lever 切回末影龙寻找的周期任务
scoreboard players set dragon_timer_state mh.temp 0
tellraw Noryea "[debug] dragon death detected"
