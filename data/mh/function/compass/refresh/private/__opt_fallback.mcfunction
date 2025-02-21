#> 为这次指南针更新兜底

## 更新右键使用组件
execute store result storage mh:temp in.cooldownSec float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run data modify storage mh:temp in.cooldownSec set value 0.001
function mh:compass/util/itemmodify_rightclick with storage mh:temp in

## 设置追踪对象未知
data remove storage mh:temp trackerData
data modify storage mh:temp trackingText.extra set value [{text:"未知",color:"gray"}]
$item modify entity @s $(slot) mh:copy_info_and_data

return fail