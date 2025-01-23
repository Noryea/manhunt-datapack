# @executor: 指南针持有者
# @args: {slot:槽位, selector:目标选择器}

# early return
execute unless items entity @s weapon compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail

# remove "out" nbt
data remove storage mh:temp out

# 获取持有者的维度作为传递参数
data modify storage mh:temp in.dimension set from entity @s Dimension
$execute as $(selector) at @s run function mh:player/pos/get with storage mh:temp in

# 
$data modify storage mh:temp in.slot set value "$(slot)"
data modify storage mh:temp in.target set from storage mh:temp out
function mh:compass/update/itemmodify_coord with storage mh:temp in