function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 可追踪队友 mh.settings 1
execute unless score 可追踪队友 mh.settings matches 0..1 run scoreboard players set 可追踪队友 mh.settings 0

function mh:settings/menu/page