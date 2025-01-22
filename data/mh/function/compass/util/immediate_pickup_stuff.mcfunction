# @执行者: 指南针掉落物
# @作用: 阻止物品丢弃

# 生成GUUID
function mh:gu/convert with entity @s

# 如果玩家有mh.cursor.compass标签，尝试从掉落物的contents槽复制到玩家指针
# 若尝试成功，直接移除标签并Return
execute on origin if entity @s[tag=mh.cursor.compass] unless items entity @s weapon.mainhand * run \
    return run function mh:compass/util/replace_cursor_stuff with storage gu:main

# 如果玩家主手空，尝试从掉落物的contents槽复制到玩家指针
# 若尝试成功，直接移除标签并Return
execute on origin unless entity @s[tag=mh.cursor.compass] unless items entity @s weapon.mainhand * run \
    return run function mh:compass/util/replace_mainhand_stuff with storage gu:main

# 最后才采用修改掉落物拾起时间的方法
execute on origin run \
    return run function mh:compass/util/pickup_stuff with storage gu:main


