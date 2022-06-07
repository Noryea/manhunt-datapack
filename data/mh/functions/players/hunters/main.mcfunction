tag @s add self

# 给予指南针
execute store result score #拥有指南针数量 mh.temp run clear @s compass{Tags:["tracker"]} 0
execute if score #拥有指南针数量 mh.temp matches 0 unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand loot mh:gameplay/compass
execute if score #拥有指南针数量 mh.temp matches 0 unless data entity @s Inventory[{tag:{Tags:["tracker"]}}] run loot give @s loot mh:gameplay/compass
scoreboard players set #拥有指南针数量 mh.temp 0

# 追踪
tag @a[team=runners,gamemode=!spectator] add trackable
execute if score 可追踪队友 mh.settings matches 1 run tag @a[team=hunters,gamemode=!spectator,tag=!self] add trackable
execute if predicate mh:holding_compass unless entity @s[gamemode=spectator] run function mh:players/hunters/track

tag @a remove trackable
tag @s remove self