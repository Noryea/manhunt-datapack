data remove storage mh:temp in

function mh:compass/select/initial
data modify storage mh:temp in.guuid set from storage gu:main out
data modify storage mh:temp in.dimension set from entity @s Dimension
data modify storage mh:temp in.target set value {}
data remove storage mh:temp in.exactDimension
execute unless score 追踪器:更新模式 mh.settings matches 3 run function mh:player/pos/get with storage mh:temp in

# loreText
function mh:compass/util/construct_lore

# trackerData
data modify storage mh:temp trackerData.selector set from storage mh:temp in.guuid
data modify storage mh:temp trackerData.info.exactDimension set from storage mh:temp in.exactDimension

function mh:compass/util/itemgive with storage mh:temp in
