# @args: {out: the GUUID of item entity}

# early return
$execute as $(out) unless entity @s[type=item] run return fail

# 
$data modify entity $(out) PickupDelay set value 0s
# 防止被别的玩家捡到
$data modify entity $(out) Owner set from entity $(out) Thrower
# 防止物品位置离玩家太远
$teleport $(out) @s
# 设置1tick后刷没
$data modify entity $(out) Age set value 5998s
# 标记标签, 表示这是玩家要捡起的物品
$tag $(out) add mh.item.pick