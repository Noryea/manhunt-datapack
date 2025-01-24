# @executor: 指南针掉落物
# > 阻止物品丢弃

# 触发丢弃事件
# 0:无动作 1:切换目标 2:转换为编辑模式
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run \
    function mh:compass/switch_target
execute if score 追踪器:丢弃时触发 mh.settings matches 2 if items entity @s contents compass run \
    item modify entity @s contents {function:"set_item", item:"writable_book"}

# 玩家可以通过丢弃退出编辑模式
execute if items entity @s contents writable_book run \
    item modify entity @s contents {function: "set_item", item: "compass"}

# 生成GUUID
function mh:gu/generate

# 如果玩家有mh.cursor.compass标签，尝试从掉落物的contents槽复制到玩家指针
execute on origin if entity @s[tag=mh.cursor.compass] unless items entity @s player.cursor * run \
    function mh:compass/util/replace_cursor_stuff with storage gu:main

# 如果玩家主手空，尝试从掉落物的contents槽复制到玩家指针
execute on origin unless entity @s[tag=mh.cursor.compass] unless items entity @s weapon.mainhand * run \
    function mh:compass/util/replace_mainhand_stuff with storage gu:main

# 最后才采用修改掉落物拾起时间的方法
execute on origin run \
    function mh:compass/util/pickup_stuff with storage gu:main

return 1