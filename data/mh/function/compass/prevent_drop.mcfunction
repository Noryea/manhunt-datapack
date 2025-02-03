# @executor: 指南针掉落物
# > 阻止物品丢弃

## 触发丢弃事件
# 0:无动作 1:切换目标 2:转换为编辑模式
execute if score 追踪器:丢弃时触发 mh.settings matches 1 run \
    function mh:compass/switch_target
execute if score 追踪器:丢弃时触发 mh.settings matches 2 if items entity @s contents compass run \
    item modify entity @s contents {function:"set_item", item:"writable_book"}

# 玩家可以通过丢弃退出编辑模式
execute if items entity @s contents writable_book run \
    item modify entity @s contents {function: "set_item", item: "compass"}

##阻止物品丢弃
# 标记标签, 表示这是玩家要捡起的物品
tag @s add mh.item.pick

scoreboard players set #result mh.temp 0
# 如果玩家有mh.cursor.compass标签, 尝试从掉落物的contents槽复制到玩家指针
execute on origin if entity @s[tag=mh.cursor.compass] unless items entity @s player.cursor * \
    store success score #result mh.temp run \
        item replace entity @s player.cursor from entity @n[type=item,distance=..7,tag=mh.item.pick] contents

# 如果玩家主手空, 尝试从掉落物的contents槽复制到玩家指针
execute on origin unless entity @s[tag=mh.cursor.compass] unless items entity @s weapon.mainhand * \
    store success score #result mh.temp run \
        item replace entity @s weapon.mainhand from entity @n[type=item,distance=..7,tag=mh.item.pick] contents

# 上面的操作执行成功，则杀死掉落物
execute if score #result mh.temp matches 1.. run \
    return run kill @s

# 最后才采用修改掉落物拾起时间的方法
data modify entity @s PickupDelay set value 0s
# 防止物品位置离玩家太远
execute on origin run tp @n[type=item,distance=..7,tag=mh.item.pick] @s
# 设置1tick后刷没
data modify entity @s Age set value 5998s
# 防止被别的玩家捡到
data modify entity @s Owner set from entity @s Thrower

return 2