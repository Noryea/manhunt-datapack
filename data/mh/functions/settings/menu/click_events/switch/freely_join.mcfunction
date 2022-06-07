function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 允许自由选队 mh.settings 1
execute unless score 允许自由选队 mh.settings matches 0..1 run scoreboard players set 允许自由选队 mh.settings 0

function mh:settings/menu/page