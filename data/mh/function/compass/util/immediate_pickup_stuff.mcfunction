# @执行者: 指南针掉落物
# @作用: 阻止物品丢弃

# 给丢出者添加标签, 方便条件判断
execute on origin run tag @s add throw


# 如果玩家有mh.cursor.compass标签，尝试从掉落物的contents槽复制到玩家指针
# 若尝试成功，直接移除标签并Return
execute if entity @p[distance=0..,tag=throw,tag=mh.cursor.compass] \
    if function mh:compass/util/replace_cursor_stuff \
        on origin run return run tag @s remove throw

# 如果玩家主手空，尝试从掉落物的contents槽复制到玩家指针
# 若尝试成功，直接移除标签并Return
execute unless items entity @p[distance=0..,tag=throw] weapon.mainhand * \
    if function mh:compass/util/replace_mainhand_stuff \
        on origin run return run tag @s remove throw

# 最后才采用修改掉落物拾起时间的方法
data modify entity @s PickupDelay set value 0s
# 防止被别的玩家捡到
data modify entity @s Owner set from entity @s Thrower
# 防止物品位置离玩家太远
teleport @s @p[distance=0..,tag=throw]
# 设置1tick后刷没
data modify entity @s Age set value 5998s
# 标记标签, 表示这是玩家要捡起的物品
tag @s add mh.item.pick

execute on origin run \
    return run tag @s remove throw