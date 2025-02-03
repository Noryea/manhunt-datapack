
# 判断递归终止条件: len == 0
execute unless data storage mh:temp inv[] run return fail

# 获取第一项的复制, 然后马上弹出第一项
data modify storage mh:temp invItem set from storage mh:temp inv[0]
data remove storage mh:temp inv[0]

# if (in.num >= 9) break;
execute store result storage mh:temp in.num byte 1 \
    store result score #result mh.temp run \
        data get storage mh:temp invItem.Slot
execute if score #result mh.temp matches 9.. run \
    return fail

# 设置slot参数和guuid参数
function mh:compass/update/private/num_to_slot with storage mh:temp in
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from storage mh:temp invItem.components."minecraft:custom_data"."mh:tracker".selector


# 执行更新
function mh:compass/update/private/update_cmd_template with storage mh:temp in

# 递归调用
data remove storage mh:temp invItem
function mh:compass/update/private/inv_foreach_hotbar