execute if score @s sds.use.shield matches 1.. unless entity @s[nbt={HurtTime:0s}] run function sds:use_shield_hurttime
execute if score @s sds.use.shield matches 1.. run scoreboard players reset @s sds.use.shield

advancement revoke @s from sds:detect/root