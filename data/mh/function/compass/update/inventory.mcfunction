execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail
execute if entity @s[team=hunters] unless function mh:player/hunters_can_have_compass run \
    return fail
execute if entity @s[team=runners] unless function mh:player/runners_can_have_compass run \
    return fail

# 设置inv为Inventory的复制
data modify storage mh:temp inv set value []
data modify storage mh:temp inv append from entity @s Inventory[{id: "minecraft:compass", components:{"minecraft:custom_data":{"mh:tracker":{}}}}]

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# foreach
function mh:compass/update/inv_foreach

# 同时更新副手
function mh:compass/update/weapon_offhand