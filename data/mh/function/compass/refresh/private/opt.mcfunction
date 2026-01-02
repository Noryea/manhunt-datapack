# @executor: 指南针持有者/指南针物品
# @in: {slot, guuid(可选), dimension} 在mh:temp.in
#> 作用: 为这次指南针更新确定目标的uuid, 然后根据情况调用更新函数

execute unless data storage mh:temp in.slot run return fail
execute unless data storage mh:temp in.dimension run return fail

# 给可追踪目标加上mh.trackable标签
execute if entity @s[type=item] on origin run function mh:compass/util/filter_my_trackable
execute unless entity @s[type=item] run function mh:compass/util/filter_my_trackable

## 必要时生成初始guuid (如果不是可追踪玩家, 也删除掉in.guuid, 转换成in.guuid不存在的情况)
scoreboard players set #ret mh.temp -1
execute store result score #ret mh.temp run function mh:compass/refresh/private/__opt_if_trackable with storage mh:temp in
execute if score #ret mh.temp matches 0 run data remove storage mh:temp in.guuid

data remove storage gu:main out
execute unless data storage mh:temp in.guuid as @a[limit=1,sort=arbitrary,tag=mh.trackable] run function mh:gu/generate
execute unless data storage mh:temp in.guuid run data modify storage mh:temp in.guuid set from storage gu:main out

# 移除mh.trackable标签
tag @a remove mh.trackable

## 一、in.guuid存在:
# 直接调用完整更新函数
execute if data storage mh:temp in.guuid run \
    return run function mh:compass/refresh/private/__opt_full with storage mh:temp in

## 二、in.guuid不存在: 
# 调用opt_fallback
return run function mh:compass/refresh/private/__opt_fallback with storage mh:temp in
