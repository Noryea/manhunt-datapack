kill @e[type=item,nbt={Item:{tag:{Tags:["tracker"]}}}]
execute as @a at @s run function mh:players/main
execute if entity @a[tag=!has.uid] run function mh:assign_uid
