execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

# 设置slot参数和guuid参数
data modify storage mh:temp in.slot set value "weapon.mainhand"
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s SelectedItem.components."minecraft:custom_data"."mh:tracker".selector

# 设置in.dimension参数
data modify storage mh:temp in.dimension set from entity @s Dimension

# 执行更新
function mh:compass/update/private/update_cmd_template with storage mh:temp in