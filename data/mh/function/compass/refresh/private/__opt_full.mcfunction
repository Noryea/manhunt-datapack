# @args: {slot, guuid, dimension}
#> 完整更新一次指南针


## 更新右键使用组件
execute store result storage mh:temp in.cooldownSec float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run data modify storage mh:temp in.cooldownSec set value 0.001
function mh:compass/util/itemmodify_rightclick with storage mh:temp in

## 更新lodestone_tracker
# 如果更新模式是定期更新, 则直接返回lastOutput
$execute if score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".lastOutput."$(dimension)"
# 不是定期更新，那么调用pos/get函数
$execute unless score 追踪器:更新模式 mh.settings matches 3 \
    as $(guuid) run function mh:player/pos/get
# 带参的物品修饰器
function mh:compass/util/itemmodify_coord with storage mh:temp in

## 更新info和trackerData
function mh:compass/util/construct_tracking_text
data modify storage mh:temp trackerData.selector set from storage mh:temp in.guuid
# 确保物品每秒至少动一下
execute store result storage mh:temp trackerData.info.scaledGametime long 0.05 run scoreboard players get 当前gametime mh.temp
# 实际维度
$data modify storage mh:temp trackerData.info.exactDimension set from entity $(guuid) Dimension
# 物品修饰器
$item modify entity @s $(slot) mh:copy_info_and_data