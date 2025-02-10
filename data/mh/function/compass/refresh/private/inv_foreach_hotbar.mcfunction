
# 判断递归终止条件: len == 0
execute unless data storage mh:temp inv[] run return fail

# 获取第一项的复制, 然后马上弹出第一项
data modify storage mh:temp invItem set from storage mh:temp inv[0]
data remove storage mh:temp inv[0]

# if (in.num >= 9) break;
data modify storage mh:temp in.num set from storage mh:temp invItem.Slot
execute if predicate {condition: "value_check", value: {type: "storage", storage: "mh:temp", path: "in.num"}, range: {min: 9}} run \
    return fail

# if (该项不是追踪器) continue;
execute unless data storage mh:temp invItem.components."minecraft:custom_data"."mh:tracker" run \
    return run function mh:compass/refresh/private/inv_foreach_hotbar

# 设置guuid参数
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from storage mh:temp invItem.components."minecraft:custom_data"."mh:tracker".selector
# 如果物品没有selector，用初始guuid
execute unless data storage mh:temp in.guuid \
    unless function mh:compass/select/initial run data modify storage mh:temp in.guuid set from storage gu:main out

# 执行更新
execute if data storage mh:temp {in:{num:-106b}} run \
    return fail
function mh:compass/refresh/private/num_to_slot with storage mh:temp in
function mh:compass/refresh/private/opt with storage mh:temp in

# 递归调用
function mh:compass/refresh/private/inv_foreach_hotbar