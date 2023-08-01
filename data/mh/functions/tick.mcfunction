execute if entity @a[tag=!has.uid] run function mh:assign_uid
execute as @a at @s run function mh:players/main
execute as @e[type=item,nbt={Item:{tag:{Tags:["tracker"]}}}] at @s as @p at @s run function mh:players/events/drop_compass
kill @e[type=item,nbt={Item:{tag:{Tags:["tracker"]}}}]
