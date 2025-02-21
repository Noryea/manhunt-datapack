
# 判断递归终止条件: len == 0
execute unless data storage mh:temp inv[] run return fail

# 设置guuid参数
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from storage mh:temp inv[0].components."minecraft:custom_data"."mh:tracker".selector

# 执行更新
data modify storage mh:temp in.num set from storage mh:temp inv[0].Slot
execute if data storage mh:temp {in:{num:-106b}} run data modify storage mh:temp in.slot set value "weapon.offhand"
execute unless data storage mh:temp {in:{num:-106b}} run function mh:compass/refresh/private/num_to_slot with storage mh:temp in
function mh:compass/refresh/private/opt

# 弹出inv的第一项
data remove storage mh:temp inv[0]

# 递归调用
function mh:compass/refresh/private/inv_foreach