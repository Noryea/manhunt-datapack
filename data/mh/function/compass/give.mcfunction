data remove storage mh:temp in

function mh:compass/select/initial
data modify storage mh:temp in.guuid set from storage gu:main out
data modify storage mh:temp in.dimension set from entity @s Dimension
function mh:player/pos/get with storage mh:temp in
# data modify storage mh:temp in.target set from storage mh:temp out

# 

function mh:compass/util/itemgive with storage mh:temp in
