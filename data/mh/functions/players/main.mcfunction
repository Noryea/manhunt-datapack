execute unless score @s mh.uid matches 1.. run tag @s remove has.uid

## 记分板事件
execute if score @s mh.died matches 1.. run function mh:players/events/die
execute if score @s mh.join matches 1.. run function mh:players/events/join
execute if score @s mh.join.hunters matches 1.. run function mh:players/events/join_hunters
execute if score @s mh.join.runners matches 1.. run function mh:players/events/join_runners

## 检测丢弃指南针
execute if score @s mh.drop.cmpass matches 1.. run function mh:players/events/drop_compass
kill @e[type=item,distance=..6,nbt={Item:{tag:{Tags:["tracker"]}}}]