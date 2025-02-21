# @executor: 指南针持有者/指南针物品
# @in: {slot, guuid(可选), dimension} 在mh:temp.in
#> 作用: 为这次指南针更新确定目标的uuid, 然后根据情况调用更新函数

execute unless data storage mh:temp in.slot run return fail
execute unless data storage mh:temp in.dimension run return fail

## 如果不是可追踪玩家, 也删除掉in.guuid, 转换成in.guuid不存在的情况
execute if entity @s[type=item] on origin run function mh:compass/util/filter_my_trackable
execute unless entity @s[type=item] run function mh:compass/util/filter_my_trackable
function mh:compass/refresh/private/__opt_filtering with storage mh:temp in
data remove storage gu:main out
    # 必要时生成初始guuid
execute unless data storage mh:temp in.guuid as @a[limit=1,sort=arbitrary,tag=mh.trackable] run function mh:gu/generate
    # 移除可追踪标签
tag @a remove mh.trackable

## 一、in.guuid存在:
    # 直接调用完整更新函数
execute if data storage mh:temp in.guuid run \
    return run function mh:compass/refresh/private/__opt_full with storage mh:temp in

## 二、in.guuid不存在: 
    # 如果甚至连初始guuid都没有, 则调用opt_fallback
execute unless data storage gu:main out run \
    return run function mh:compass/refresh/private/__opt_fallback with storage mh:temp in

    # 有初始guuid, 用它作为guuid调用完整更新函数
    data modify storage mh:temp in.guuid set from storage gu:main out
    function mh:compass/refresh/private/__opt_full with storage mh:temp in


