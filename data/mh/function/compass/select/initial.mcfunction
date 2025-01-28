# 给可追踪目标加上mh.trackable标签
function mh:compass/util/filter_my_trackable

# remove "out" nbt
data remove storage gu:main out

# select first trackable player
execute as @a[limit=1,sort=arbitrary,tag=mh.trackable] run function mh:gu/generate

# 移除所有玩家的标签
tag @a remove mh.trackable