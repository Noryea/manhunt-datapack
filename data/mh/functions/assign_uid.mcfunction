scoreboard players add #uid mh.uid 1
execute as @a[tag=!has.uid,sort=arbitrary,limit=1] run function mh:players/events/apply_uid

execute if entity @a[tag=!has.uid] run function mh:assign_uid

