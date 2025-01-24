# 缓存一次坐标（用于跨维度追踪）
execute unless entity @s[advancements={mh:detect/changed_dimension=true}] \
    if function mh:gu/generate run \
        function mh:player/pos/save_current with storage gu:main

# 选队触发器
execute unless score 允许自由选队 mh.settings matches 1 run scoreboard players reset @s mh.join.hunters
execute unless score 允许自由选队 mh.settings matches 1 run scoreboard players reset @s mh.join.runners
execute if score 允许自由选队 mh.settings matches 1 run scoreboard players enable @s mh.join.hunters
execute if score 允许自由选队 mh.settings matches 1 run scoreboard players enable @s mh.join.runners

# 让进度可以重新触发
advancement revoke @s only mh:detect/tick_12t