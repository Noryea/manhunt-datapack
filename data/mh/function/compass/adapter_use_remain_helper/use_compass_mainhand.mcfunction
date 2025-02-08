execute unless items entity @s weapon.mainhand compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return fail
execute if score 追踪器:右键更新音效 mh.settings matches 1 run playsound minecraft:block.stone_button.click_on player @s ~ ~ ~ 0.6 1.21 0.6
function mh:compass/refresh/weapon_mainhand