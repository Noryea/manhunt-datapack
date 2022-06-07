function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 逃者:显示距离 mh.settings 1
execute unless score 逃者:显示距离 mh.settings matches 0..1 run scoreboard players set 逃者:显示距离 mh.settings 0

function mh:settings/menu/page