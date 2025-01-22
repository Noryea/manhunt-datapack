# @args: {out: the selector of item entity}
# > 直接让玩家的指针位置替换这个物品，如果玩家指针不为空则无作用

# early return
$execute as $(out) unless entity @s[type=item] run return fail

# 执行replaceitem
$item replace entity @s player.cursor from entity $(out) contents
# 杀死实体
$kill $(out)