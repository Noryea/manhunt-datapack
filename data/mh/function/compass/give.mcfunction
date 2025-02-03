data remove storage mh:temp in

function mh:compass/select/initial
data modify storage mh:temp in.guuid set from storage gu:main out
data modify storage mh:temp in.dimension set from entity @s Dimension
data remove storage mh:temp in.exactDimension
execute unless score 追踪器:更新模式 mh.settings matches 3 run function mh:player/pos/get with storage mh:temp in
execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp in.target set value {pos:[0,0,0],dimension:"mh:impossible"}

# 设置mh:temp的trackableCount，若可为2以上则物品修饰器copy_data_and_lore会显示额外信息
function mh:compass/util/filter_my_trackable
execute store result storage mh:temp trackableCount int 1 if entity @a[tag=mh.trackable]
tag @a remove mh.trackable

# loreText
function mh:compass/util/construct_lore

# trackerData
data modify storage mh:temp trackerData.selector set from storage mh:temp in.guuid
data modify storage mh:temp trackerData.info.exactDimension set from storage mh:temp in.exactDimension

function mh:compass/util/itemgive with storage mh:temp in
