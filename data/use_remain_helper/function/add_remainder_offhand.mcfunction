# early return
execute unless data entity @s {Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{"ur:remaining_flag":1b}}}]} \
    run return fail

data remove storage ur:temp Slot
data remove storage ur:temp ItemStack
# Force item count to be 1
item modify entity @s weapon.offhand {"function": "minecraft:set_count", "count": 1, "add": false}
# Set "ur:offhand_marker" tag to distinct mainhand and offhand, since minecraft don't provide item slot source directly.
item modify entity @s weapon.offhand use_remain_helper:__mark_offhand

# specify the slot
data modify storage ur:temp Slot set value "weapon.offhand"
# create a copy of holding item stack
data modify storage ur:temp ItemStack set from entity @s Inventory[{Slot:-106b}]
# COPY: set count to 1
#data modify storage ur:temp ItemStack.count set value 1
# COPY: delete use_remainder
data remove storage ur:temp ItemStack.components.minecraft:use_remainder
# COPY: delete custom offhand_marker
data remove storage ur:temp ItemStack.components.minecraft:custom_data.ur:offhand_marker

# HAND: set copy as use_remainder component
function use_remain_helper:__set_remainder with storage ur:temp
return 1