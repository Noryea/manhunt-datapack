function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 总是更新指南针 mh.settings 1
execute unless score 总是更新指南针 mh.settings matches 0..1 run scoreboard players set 总是更新指南针 mh.settings 0

function mh:settings/menu/page