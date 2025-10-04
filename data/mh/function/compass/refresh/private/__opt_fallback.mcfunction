#> 为这次指南针更新兜底

## 更新右键使用组件
function mh:compass/refresh/private/right_click_relative

## 设置追踪对象未知
data remove storage mh:temp trackerData
data modify storage mh:temp trackingText.extra set value [{text:"未知",color:"gray"}]
$item modify entity @s $(slot) mh:copy_info_and_data

return fail