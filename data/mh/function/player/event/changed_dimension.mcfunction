advancement revoke @s only mh:detect/changed_dimension

# 如果玩家维度改变，记录在mh:temp的LastPos复合标签缓存的坐标到数据库
function mh:player/pos/save_last_dimension with entity @s