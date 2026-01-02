#> 如果selector对应的玩家在线, 并且有可追踪标签
$execute as $(selector) if entity @s[tag=mh.trackable] run return 1
return fail