# @executor: 指南针持有者
# @args: {slot:槽位, guuid:目标的GUUID, dimension: 调用者维度}

# early return
$execute unless items entity @s $(slot) compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail

# remove "out" nbt
data remove storage mh:temp out

# 获取坐标
$data modify storage mh:temp in.guuid set value $(guuid)
$function mh:player/pos/get {guuid: $(guuid), dimension: "$(dimension)"}

# 
$data modify storage mh:temp in.slot set value "$(slot)"
data modify storage mh:temp in.target set from storage mh:temp out
function mh:compass/update/itemmodify_coord with storage mh:temp in