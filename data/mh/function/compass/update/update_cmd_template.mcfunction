# @executor: 指南针持有者
# @args: {slot:槽位, selector:目标选择器, dimension:持有者所在维度}

# remove "out" nbt
data remove storage mh:temp out

# 获取目标坐标
$execute at @s as $(selector) run function mh:player/pos/get {dimension: "$(dimension)"}

# 
$data modify storage mh:temp in.slot set value "$(slot)"
data modify storage mh:temp in.target set from storage mh:temp out
function mh:compass/update/itemmodify_coord with storage mh:temp in