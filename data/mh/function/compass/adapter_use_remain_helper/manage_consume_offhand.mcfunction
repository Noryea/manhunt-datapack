execute unless items entity @s weapon.offhand compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail

data modify storage mh:temp in.slot set value "weapon.offhand"
function mh:compass/refresh/private/right_click_relative
