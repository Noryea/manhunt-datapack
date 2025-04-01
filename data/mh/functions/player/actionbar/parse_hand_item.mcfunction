# @output: trackerData, targetCopy在mh:temp; 
#   不进行x,y,z的读取和运算

# early return
# execute unless items entity @s weapon.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
#     return fail

data remove storage mh:temp trackerData
data remove storage mh:temp targetCopy

execute if items entity @s weapon.mainhand compass[minecraft:custom_data~{"mh:tracker":{}}] run data modify storage mh:temp trackerData set from entity @s SelectedItem.components."minecraft:custom_data"."mh:tracker"
execute if data storage mh:temp trackerData run \
    return run data modify storage mh:temp targetCopy set from entity @s SelectedItem.components."minecraft:lodestone_tracker".target

data modify storage mh:temp trackerData set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"."mh:tracker"
data modify storage mh:temp targetCopy set from entity @s Inventory[{Slot:-106b}].components."minecraft:lodestone_tracker".target