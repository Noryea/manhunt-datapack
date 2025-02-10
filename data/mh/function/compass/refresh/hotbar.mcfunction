execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail
    
# 设置inv为Inventory的复制
data remove storage mh:temp inv
data modify storage mh:temp inv append from entity @s Inventory[{id:"minecraft:compass"}]

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# foreach_hotbar
function mh:compass/refresh/private/inv_foreach_hotbar

# 删除inv的剩余元素
# data remove storage mh:temp inv

# 同时更新副手
function mh:compass/refresh/weapon_offhand