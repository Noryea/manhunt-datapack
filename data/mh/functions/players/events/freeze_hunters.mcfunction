execute if score @s mh.setting.frz matches 0..100 run scoreboard players operation hunters.freeze mh.temp = @s mh.setting.frz
execute if score @s mh.setting.frz matches 0..100 store result bossbar mh:freeze max run scoreboard players get @s mh.setting.frz
execute if score @s mh.setting.frz matches 0..100 as @a at @s run playsound block.stone.place record @s ~ ~ ~ 0.9 1.0 0.9
#execute if score @s mh.setting.frz matches 0..100 run tellraw @a ["[",{"selector":"@s"},"] ","猎人将被冻结",{"score":{"objective": "mh.setting.frz","name": "@s"},"color": "aqua"},"秒"]
execute unless score @s mh.setting.frz matches 0..100 run tellraw @s "\u00a7c应该输入范围为0-100的整数"

scoreboard players reset @s mh.setting.frz
