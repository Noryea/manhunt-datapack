# @执行者: 指南针掉落物
# @作用: 直接让玩家的主手拿起这个物品，如果玩家主手不为空则无作用

# early return
execute unless entity @s[type=item] run return fail
execute on origin if items entity @s weapon.mainhand * run return fail

tag @s add this
# 执行replaceitem
execute on origin run item replace entity @s weapon.mainhand from entity @n[type=item,tag=this] contents
# 杀死实体
kill @s
return 1