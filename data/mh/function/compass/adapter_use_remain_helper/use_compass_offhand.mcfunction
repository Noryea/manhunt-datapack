execute unless items entity @s weapon.offhand compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail
playsound minecraft:block.stone_button.click_on player @s ~ ~ ~ 0.95 1.11 0.95
function mh:compass/refresh/weapon_offhand