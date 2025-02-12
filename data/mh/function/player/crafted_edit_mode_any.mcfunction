# @n[type=item,distance=..3,tag=mh.item.pick]
tag @s add this
execute if entity @s[advancements={mh:detect/crafted_edit_mode_tracker=true}] run tag @s add mh.craft.tracker
execute if entity @s[advancements={mh:detect/crafted_edit_mode_old_tracker=true}] run tag @s add mh.craft.tracker
summon item ~ ~ ~ {Item:{id:"compass", count:1b},Age:4001s,PickupDelay:0,Tags:["mh.item.pick"]}
execute as @n[tag=mh.item.pick,nbt={Age:4001s}] run function mh:compass/util/itemsummon_from_crafting
# item modify entity @s player.crafting.1 {function:"set_count",count:1}
tag @s remove this
tag @s remove mh.craft.tracker

advancement revoke @s only mh:detect/crafted_edit_mode_any
advancement revoke @s only mh:detect/crafted_edit_mode_tracker
advancement revoke @s only mh:detect/crafted_edit_mode_old_any
advancement revoke @s only mh:detect/crafted_edit_mode_old_tracker