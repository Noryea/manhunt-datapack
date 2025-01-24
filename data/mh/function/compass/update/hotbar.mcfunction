execute unless items entity @s hotbar.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail

# 设置inv为Inventory的复制
data modify storage mh:temp inv set from entity @s Inventory[{id: "minecraft:compass", components:{"minecraft:custom_data":{"mh:tracker":{}}}}]
