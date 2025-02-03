# @n[type=item,distance=..3,tag=mh.item.pick]
tag @s add this
summon item ~ ~ ~ {Item:{id:"compass", count:1b},Age:4001s,PickupDelay:0,Tags:["mh.item.pick"]}
execute as @n[tag=mh.item.pick,nbt={Age:4001s}] run function mh:compass/util/itemsummon_from_crafting

tag @s remove this
advancement revoke @s only mh:detect/crafted_edit_mode