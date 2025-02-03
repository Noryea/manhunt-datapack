# @args: {slot:槽位, guuid:目标的GUUID, dimension: 调用者维度}

$data modify storage mh:temp in.slot set value "$(slot)"
$data modify storage mh:temp in.guuid set value "$(guuid)"

## 更新lore和custom_data
execute if entity @s[type=item] on origin run function mh:compass/util/construct_lore
execute unless entity @s[type=item] run function mh:compass/util/construct_lore
$execute unless entity $(guuid) run \
    data modify storage mh:temp loreText[0] set value {text:"正在追踪：未知",color:"gray"}
data remove storage mh:temp trackerData
$data modify storage mh:temp trackerData.info.exactDimension set from entity $(guuid) Dimension
$item modify entity @s $(slot) mh:copy_lore_and_data

## 更新lodeStone_tracker
# early return
$execute unless entity $(guuid) run \
    return fail
# 如果更新模式是定期更新, 则直接返回lastOutPut
$execute if score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".lastOutPut."$(dimension)"
# 不是定期更新，那么调用pos/get函数
$execute unless score 追踪器:更新模式 mh.settings matches 3 run \
    function mh:player/pos/get {guuid: $(guuid), dimension: "$(dimension)"}
# execute unless score 追踪器:更新模式 mh.settings matches 3 run data modify storage mh:temp in.target set from storage mh:temp out
function mh:compass/util/itemmodify_coord with storage mh:temp in
