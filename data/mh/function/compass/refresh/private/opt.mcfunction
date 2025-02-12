# @executor: 指南针持有者/指南针物品
# @args: {slot:槽位, guuid:目标的GUUID, dimension: 调用者维度}

# $data modify storage mh:temp in.guuid set value "$(guuid)"
# $data modify storage mh:temp in.slot set value "$(slot)"

# 如果目标不在线 移除in.guuid
$execute unless entity $(guuid) run data remove storage mh:temp in.guuid
# 构造lore、创建空的trackerData
execute if entity @s[type=item] on origin run function mh:compass/util/construct_lore
execute unless entity @s[type=item] run function mh:compass/util/construct_lore
data modify storage mh:temp trackerData set value {}

# 如果in.guuid不存在, early return
$execute unless data storage mh:temp in.guuid run \
    return run item modify entity @s $(slot) mh:copy_lore_and_data


# 判断目标是否为指南针持有者的可追踪玩家之一 不是则获取初始
execute if entity @s[type=item] on origin run function mh:compass/util/filter_my_trackable
execute unless entity @s[type=item] run function mh:compass/util/filter_my_trackable
$execute as $(guuid) store result score #result mh.temp if entity @s[tag=mh.trackable]
tag @a remove mh.trackable
execute if score #result mh.temp matches 0 run data remove storage mh:temp in.guuid
execute if score #result mh.temp matches 0 if entity @s[type=item] on origin run function mh:compass/select/initial
execute if score #result mh.temp matches 0 unless entity @s[type=item] run function mh:compass/select/initial
execute if score #result mh.temp matches 0 run data modify storage mh:temp in.guuid set from storage gu:main out
# 如果目标不是玩家可追踪, 尝试以新的in.guuid从头运行(如果in.guuid存在), 
execute if score #result mh.temp matches 0 if data storage mh:temp in.guuid run \
    return run function mh:compass/refresh/private/opt with storage mh:temp in
# 不存在新的in.guuid, 则设置正在追踪为未知并early return
execute if score #result mh.temp matches 0 run data modify storage mh:temp trackerData set value {}
execute if score #result mh.temp matches 0 run data modify storage mh:temp itemInfoText[1].extra set value [{text:"未知",color:"gray"}]
$execute if score #result mh.temp matches 0 run return run item modify entity @s $(slot) mh:copy_lore_and_data


## 更新lodestone_tracker
# 如果更新模式是定期更新, 则直接返回lastOutput
$execute if score 追踪器:更新模式 mh.settings matches 3 run \
    data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".lastOutput."$(dimension)"
# 不是定期更新，那么调用pos/get函数
$execute unless score 追踪器:更新模式 mh.settings matches 3 \
    as $(guuid) run function mh:player/pos/get
# 带参的物品修饰器
function mh:compass/util/itemmodify_coord with storage mh:temp in


## 更新右键使用组件
execute store result storage mh:temp in.cooldownSec float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run data modify storage mh:temp in.cooldownSec set value 0.001
function mh:compass/util/itemmodify_rightclick with storage mh:temp in


## 更新trackerData
$data modify storage mh:temp trackerData.selector set value $(guuid)
# 如果是定期更新，则往指南针写入游戏时间，确保物品总是动一下
execute if score 追踪器:更新模式 mh.settings matches 3 store result storage mh:temp trackerData.info.gameTime long 1 run time query gametime
execute unless score 追踪器:更新模式 mh.settings matches 3 run data remove storage mh:temp trackerData.info.gameTime
# execute store result storage mh:temp trackerData.info.gameTime long 1 run time query gametime
# 实际维度
$execute as $(guuid) run data modify storage mh:temp trackerData.info.exactDimension set from entity @s Dimension
# 物品修饰器
$item modify entity @s $(slot) mh:copy_lore_and_data