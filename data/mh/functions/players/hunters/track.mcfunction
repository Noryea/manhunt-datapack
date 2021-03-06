# copy
data modify storage mh:temp Items append from entity @s SelectedItem
data modify storage mh:temp Items append from entity @s Inventory[{Slot:-106b}]
data modify storage mh:temp Items[{Slot:-106b}].Slot set value 1b
execute in minecraft:overworld run data modify block 29999985 254 29999984 Items set from storage mh:temp Items
data remove storage mh:temp Items

# track
## Select
execute as @a[tag=trackable] if score @s mh.uid = @p[tag=self] mh.tracking run tag @s add tracking
execute if entity @a[tag=trackable,scores={mh.uid=1..}] unless entity @p[tag=tracking] run function mh:compass/select

## Nbt *跨维度追踪仅支持原版三大维度
execute if entity @p[tag=tracking] run function mh:compass/refresh

## 信息显示
execute if score 逃者:显示Y坐标 mh.settings matches 1 if entity @p[tag=tracking,team=runners] unless entity @a[tag=tracking,distance=0..] run data modify storage mh:temp ActionBar append value '[{"text":" Y坐标:","color":"gray"},{"nbt":"Pos.Y","storage":"mh:temp","color":"green"},"  "]'
execute if score 逃者:显示Y坐标 mh.settings matches 2 if entity @p[tag=tracking,team=runners] run data modify storage mh:temp ActionBar append value '[{"text":" Y坐标:","color":"gray"},{"nbt":"Pos.Y","storage":"mh:temp","color":"green"},"  "]'
execute if score 逃者:显示维度 mh.settings matches 1 if entity @p[tag=tracking,team=runners] run data modify storage mh:temp ActionBar append value '[{"text":"  维度:","color":"gray"},{"nbt":"Dimension","storage":"mh:temp","color":"green"},"  "]'
execute if score 逃者:显示距离 mh.settings matches 1 if entity @p[tag=tracking,team=runners] run function mh:compass/distance_math/do
execute if score 逃者:显示距离 mh.settings matches 1 if entity @p[tag=tracking,team=runners] run data modify storage mh:temp ActionBar append value '[{"text":"  距离:","color":"gray"},{"nbt":"Distance","storage":"mh:temp","color":"green"},{"text":"m ","color":"green"}]'

execute if score 队友:显示Y坐标 mh.settings matches 1 if entity @p[tag=tracking,team=hunters,tag=!self] unless entity @a[tag=tracking,distance=0..] run data modify storage mh:temp ActionBar append value '[{"text":" Y坐标:","color":"gray"},{"nbt":"Pos.Y","storage":"mh:temp","color":"red"},"  "]'
execute if score 队友:显示Y坐标 mh.settings matches 2 if entity @p[tag=tracking,team=hunters,tag=!self] run data modify storage mh:temp ActionBar append value '[{"text":" Y坐标:","color":"gray"},{"nbt":"Pos.Y","storage":"mh:temp","color":"red"},"  "]'
execute if score 队友:显示维度 mh.settings matches 1 if entity @p[tag=tracking,team=hunters,tag=!self] run data modify storage mh:temp ActionBar append value '[{"text":"  维度:","color":"gray"},{"nbt":"Dimension","storage":"mh:temp","color":"red"},"  "]'
execute if score 队友:显示距离 mh.settings matches 1 if entity @p[tag=tracking,team=hunters,tag=!self] run function mh:compass/distance_math/do
execute if score 队友:显示距离 mh.settings matches 1 if entity @p[tag=tracking,team=hunters,tag=!self] run data modify storage mh:temp ActionBar append value '[{"text":"  距离:","color":"gray"},{"nbt":"Distance","storage":"mh:temp","color":"red"},{"text":"m ","color":"red"}]'

execute if entity @p[tag=tracking] run title @s actionbar [{"text":" 目标:","color":"gray"},{"selector":"@p[tag=tracking]"},"  ",{"nbt":"ActionBar[0]","storage":"mh:temp","interpret":true},{"nbt":"ActionBar[1]","storage":"mh:temp","interpret":true},{"nbt":"ActionBar[2]","storage":"mh:temp","interpret":true}]

# replace
execute in minecraft:overworld run loot replace entity @s weapon.mainhand 2 mine 29999985 254 29999984 minecraft:air{isShulkerMarker:1b}

# reset
execute in minecraft:overworld run data remove block 29999985 254 29999984 Items
tag @a remove tracking
kill 0-0-0-0-0c46e6e
data remove storage mh:temp ActionBar
data remove storage mh:temp Dimension
data remove storage mh:temp Pos
