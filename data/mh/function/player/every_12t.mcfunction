# 缓存一次坐标（用于跨维度追踪）
execute unless entity @s[advancements={mh:detect/changed_dimension=true}] run function mh:player/pos/save_current with entity @s

# 让进度可以重新触发
advancement revoke @s only mh:detect/tick_12t