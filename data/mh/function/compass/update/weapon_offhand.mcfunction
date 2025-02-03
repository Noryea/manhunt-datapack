execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

# 设置mh:temp的trackableCount，若可为2以上则物品修饰器copy_data_and_lore会显示额外信息
function mh:compass/util/filter_my_trackable
execute store result storage mh:temp trackableCount int 1 if entity @a[tag=mh.trackable]
tag @a remove mh.trackable

# 设置slot参数和guuid参数
data modify storage mh:temp in.slot set value "weapon.offhand"
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"."mh:tracker".selector

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# 执行更新
function mh:compass/update/private/update_cmd_template with storage mh:temp in