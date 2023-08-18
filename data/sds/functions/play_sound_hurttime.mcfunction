## To detect the shield is firmly disabled
execute as @a[tag=sds.self,advancements={sds:detect/using_shield=false}] at @s as @a[tag=sds.disabler,distance=0..4] run playsound item.shield.break player @s ~ ~ ~

tag @a remove sds.self
tag @a remove sds.disabler