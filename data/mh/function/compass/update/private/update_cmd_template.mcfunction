# @executor: 指南针持有者
# @args: {slot:槽位, guuid:目标的GUUID, dimension: 调用者维度}

# early return
$execute unless items entity @s $(slot) compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail
# remove "out" nbt
data remove storage mh:temp out

## 设置components."minecraft:lodestone_tracker  "参数
data modify storage mh:temp in.target set value {}

# 如果更新模式是定期更新, 则直接返回lastOutPut
$execute if score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp in.target set from storage mh:pdb lastOutPut."$(guuid)"
# 不是定期更新，那么调用pos/get函数
$execute unless score 追踪器:更新模式 mh.settings matches 3 run \
    function mh:player/pos/get {guuid: $(guuid), dimension: "$(dimension)"}
execute unless score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp in.target set from storage mh:temp out

## 设置slot
$data modify storage mh:temp in.slot set value "$(slot)"
function mh:compass/update/private/itemmodify_coord with storage mh:temp in
