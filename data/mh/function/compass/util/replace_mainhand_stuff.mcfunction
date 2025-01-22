# @args: {out: the GUUID}
# @作用: 直接让玩家的主手拿起这个物品，如果玩家主手不为空则无作用

# early return
$execute as $(out) unless entity @s[type=item] run return fail

# 执行replaceitem
$item replace entity @s weapon.mainhand from entity $(out) contents
# 杀死实体
$kill $(out)