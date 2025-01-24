execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail
execute if entity @s[team=hunters] unless function mh:player/hunters_can_have_compass run \
    return fail
execute if entity @s[team=runners] unless function mh:player/runners_can_have_compass run \
    return fail

# 设置slot参数和guuid参数
data modify storage mh:temp in.slot set value "weapon.mainhand"
data remove storage mh:temp in.guuid
data modify storage mh:temp in.guuid set from entity @s SelectedItem.components."minecraft:custom_data"."mh:tracker".selector

# 执行更新
function mh:compass/update/update_cmd_template with storage mh:temp in