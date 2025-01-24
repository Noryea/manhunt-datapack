
# 判断递归终止条件: len == 0
execute unless data storage mh:temp inv[] run return fail

# 设置slot参数和guuid参数
data modify storage mh:temp in.num set from storage mh:temp inv[0].Slot
function mh:compass/update/num_to_slot with storage mh:temp in
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from storage mh:temp inv[0].components."minecraft:custom_data"."mh:tracker".selector

# 用完后弹出inv的第一项
data remove storage mh:temp inv[0]

# 执行更新
function mh:compass/update/update_cmd_template with storage mh:temp in

# 递归调用
function mh:compass/update/inv_foreach