
# 判断递归终止条件: len == 0
execute unless data storage mh:temp inv[] run return fail

# 获取第一项的复制, 然后马上弹出第一项
data modify storage mh:temp invItem set from storage mh:temp inv[0]
data remove storage mh:temp inv[0]

# if (in.num >= 9) break;
data modify storage mh:temp in.num set from storage mh:temp invItem.Slot
execute if predicate {condition: "value_check", value: {type: "storage", storage: "mh:temp", path: "in.num"}, range: {min: 9}} run \
    return fail

# 设置slot参数和guuid参数
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from storage mh:temp invItem.components."minecraft:custom_data"."mh:tracker".selector

# 执行更新
execute if data storage mh:temp {in:{num:-106b}} run \
    return run function mh:compass/update/private/inv_foreach_hotbar
function mh:compass/update/private/num_to_slot with storage mh:temp in
function mh:compass/update/private/update_cmd_template with storage mh:temp in

# 递归调用
data remove storage mh:temp invItem
function mh:compass/update/private/inv_foreach_hotbar