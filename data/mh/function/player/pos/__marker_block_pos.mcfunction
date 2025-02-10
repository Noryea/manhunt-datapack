# @executor: marker
# 为什么要读取方块坐标：
#  如果直接读取玩家的Pos, 在坐标为负时，因为是向下取整而不是向上取整，指南针指向位置会偏移一格
#  这很烦，1.20.4之前的磁石指针标签还是可以存浮点值的，现在1.21只能存整数

execute align xyz run tp @s ~ ~ ~
data modify storage mh:temp in.target.pos set from entity @s Pos
kill @s[type=marker]