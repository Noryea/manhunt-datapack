execute if score #result mh.temp matches 0 run data remove storage mh:temp in.guuid

## 更新右键使用组件
execute store result storage mh:temp in.cooldownSec float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run data modify storage mh:temp in.cooldownSec set value 0.001
function mh:compass/util/itemmodify_rightclick with storage mh:temp in

## 更新lore和custom_data
execute if entity @s[type=item] on origin run function mh:compass/util/construct_lore
execute unless entity @s[type=item] run function mh:compass/util/construct_lore
# 如果目标不是可追踪 设置初始guuid
data modify storage mh:temp trackerData set value {}
execute if score #result mh.temp matches 0 if entity @s[type=item] on origin run function mh:compass/select/initial
execute if score #result mh.temp matches 0 unless entity @s[type=item] run function mh:compass/select/initial
execute if score #result mh.temp matches 0 run data modify storage mh:temp trackerData.selector set from storage gu:main out
# 如果是定期更新，则往指南针写入游戏时间，确保物品总是动一下
execute if score 追踪器:更新模式 mh.settings matches 3 store result storage mh:temp trackerData.info.gameTime long 1 run time query gametime
execute unless score 追踪器:更新模式 mh.settings matches 3 run data remove storage mh:temp trackerData.info.gameTime