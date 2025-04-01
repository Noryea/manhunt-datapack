#> 如果guuid对应的玩家不在线或没可追踪标签, 删除in.guuid, 转换成in.guuid不存在的情况
$execute as $(guuid) if entity @s[tag=mh.trackable] run return 1
data remove storage mh:temp in.guuid