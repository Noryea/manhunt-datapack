execute unless items entity @s weapon.mainhand compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail
playsound minecraft:block.stone_button.click_on player @s ~ ~ ~ 0.8 1.11 0.8
function mh:compass/refresh/weapon_mainhand