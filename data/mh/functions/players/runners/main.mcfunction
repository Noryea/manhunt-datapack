tag @s add self

execute if score 逃者发光 mh.settings matches 1 run effect give @s glowing 1 1 true

# 追踪
##
execute if score 可追踪队友 mh.settings matches 1 run tag @a[team=runners,gamemode=!spectator,tag=!self] add trackable

## 给予指南针
execute store result score #拥有指南针数量 mh.temp run clear @s compass{Tags:["tracker"]} 0
execute if entity @a[tag=trackable] if score #拥有指南针数量 mh.temp matches 0 unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand loot mh:gameplay/compass
execute if entity @a[tag=trackable] if score #拥有指南针数量 mh.temp matches 0 unless data entity @s Inventory[{tag:{Tags:["tracker"]}}] run loot give @s loot mh:gameplay/compass
scoreboard players set #拥有指南针数量 mh.temp 0
execute unless entity @a[tag=trackable] run clear @s compass{Tags:["tracker"]}

execute if entity @a[tag=trackable] if predicate mh:holding_compass run function mh:players/runners/track

tag @a remove trackable

tag @s remove self
