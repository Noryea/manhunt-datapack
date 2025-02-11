# @executor: 指南针持有者/指南针物品
# @args: {slot:槽位, guuid:目标的GUUID, dimension: 调用者维度}

# $data modify storage mh:temp in.slot set value "$(slot)"
# $data modify storage mh:temp in.guuid set value "$(guuid)"
# 如果目标不在线 移除in.guuid
$execute unless entity $(guuid) run data remove storage mh:temp in.guuid
# 判断目标是否为指南针持有者的可追踪玩家之一 不是则标记#result=0
$execute if entity $(guuid) if entity @s[type=item] on origin run function mh:compass/util/filter_my_trackable
$execute if entity $(guuid) unless entity @s[type=item] run function mh:compass/util/filter_my_trackable
$execute as $(guuid) store result score #result mh.temp if entity @s[tag=mh.trackable]
tag @a remove mh.trackable

# 提取无函数宏的命令
function mh:compass/refresh/private/opt_extracted

# 实际维度
$execute if data storage mh:temp in.guuid run data modify storage mh:temp trackerData.info.exactDimension set from entity $(guuid) Dimension
# 物品修饰器
$item modify entity @s $(slot) mh:copy_lore_and_data


## 更新lodestone_tracker
# early return
execute unless data storage mh:temp in.guuid run \
    return fail
# 如果更新模式是定期更新, 则直接返回lastOutput
$execute if score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".lastOutput."$(dimension)"
# 不是定期更新，那么调用pos/get函数
$execute unless score 追踪器:更新模式 mh.settings matches 3 \
    as $(guuid) run function mh:player/pos/get
# 带参的物品修饰器
function mh:compass/util/itemmodify_coord with storage mh:temp in
