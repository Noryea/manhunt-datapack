function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 队友:显示Y坐标 mh.settings 1
execute unless score 队友:显示Y坐标 mh.settings matches 0..2 run scoreboard players set 队友:显示Y坐标 mh.settings 0

function mh:settings/menu/page