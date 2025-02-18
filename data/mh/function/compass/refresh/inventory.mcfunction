execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

# 设置inv为Inventory的复制
data modify storage mh:temp inv set value []
data modify storage mh:temp inv append from entity @s Inventory[{id: "minecraft:compass", components:{"minecraft:custom_data":{"mh:tracker":{}}}}]

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# foreach
function mh:compass/refresh/private/inv_foreach

# dirty fix: 修复追踪器信息不更新
execute unless data storage mh:temp in.guuid run function mh:compass/refresh/inventory_iteminfo_only