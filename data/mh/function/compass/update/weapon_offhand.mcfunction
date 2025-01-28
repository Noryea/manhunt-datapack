execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

# 设置slot参数和guuid参数
data modify storage mh:temp in.slot set value "weapon.offhand"
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"."mh:tracker".selector

# 执行更新
function mh:compass/update/private/update_cmd_template with storage mh:temp in