execute unless items entity @s container.* compass[minecraft:custom_data~{"mh:tracker":{}}] unless items entity @s container.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail

# 设置inv为Inventory的复制
data modify storage mh:temp inv set value []
data modify storage mh:temp inv append from entity @s Inventory[{id: "minecraft:compass", components:{"minecraft:custom_data":{"mh:tracker":{}}}}]

function mh:compass/update/inv_foreach
