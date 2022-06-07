execute as @a[tag=trackable] if score @s mh.uid > @p[tag=self] mh.tracking run scoreboard players set 存在uid更高的玩家 mh.tracking 1
execute unless score 存在uid更高的玩家 mh.tracking matches 1 run scoreboard players set @s mh.tracking 0
execute if score 存在uid更高的玩家 mh.tracking matches 1 run scoreboard players add @s mh.tracking 1
scoreboard players reset 存在uid更高的玩家 mh.tracking

execute as @a[tag=trackable] if score @s mh.uid = @p[tag=self] mh.tracking run tag @s add tracking
#loop
execute unless entity @p[tag=tracking] run function mh:compass/select
