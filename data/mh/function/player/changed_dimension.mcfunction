# 如果玩家维度改变，记录在mh:temp的lastPos复合标签缓存的坐标到数据库
function mh:gu/generate
function mh:player/pos/save_enter_dimension with storage gu:main

# 让进度可以重新触发
advancement revoke @s only mh:detect/changed_dimension