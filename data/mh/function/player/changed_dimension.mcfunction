# 如果玩家维度改变，记录缓存在mh:temp的latestPos复合标签的坐标到数据库
function mh:gu/generate
execute unless data entity @s {Health:0.0f} run function mh:player/pos/save_enter_dimension with storage gu:main

# 同时在数据库删除当前维度
data modify storage mh:temp in.dimension set from entity @s Dimension
data modify storage mh:temp in.guuid set from storage gu:main out
function mh:player/pos/private/remove_dimension with storage mh:temp in

# 让进度可以重新触发
advancement revoke @s only mh:detect/changed_dimension