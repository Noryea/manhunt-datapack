function mh:settings/menu/no_sendback
playsound ui.button.click record @s

scoreboard players add 逃者死亡后 mh.settings 1
execute unless score 逃者死亡后 mh.settings matches 0..2 run scoreboard players set 逃者死亡后 mh.settings 0

function mh:settings/menu/page