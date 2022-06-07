function mh:settings/menu/no_sendback


tag @a remove has.uid
scoreboard players reset * mh.uid
execute if entity @a[tag=!has.uid] run function mh:assign_uid

data merge storage mh:temp {TextCompound:[]}
#仅到30个
execute if entity @a[team=runners,scores={mh.uid=1}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=1}]"}]'
execute if entity @a[team=runners,scores={mh.uid=2}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=2}]"}]'
execute if entity @a[team=runners,scores={mh.uid=3}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=3}]"}]'
execute if entity @a[team=runners,scores={mh.uid=4}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=4}]"}]'
execute if entity @a[team=runners,scores={mh.uid=5}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=5}]"}]'
execute if entity @a[team=runners,scores={mh.uid=6}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=6}]"}]'
execute if entity @a[team=runners,scores={mh.uid=7}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=7}]"}]'
execute if entity @a[team=runners,scores={mh.uid=8}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=8}]"}]'
execute if entity @a[team=runners,scores={mh.uid=9}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=9}]"}]'
execute if entity @a[team=runners,scores={mh.uid=10}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=10}]"}]'
execute if entity @a[team=runners,scores={mh.uid=11}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=11}]"}]'
execute if entity @a[team=runners,scores={mh.uid=12}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=12}]"}]'
execute if entity @a[team=runners,scores={mh.uid=13}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=13}]"}]'
execute if entity @a[team=runners,scores={mh.uid=14}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=14}]"}]'
execute if entity @a[team=runners,scores={mh.uid=15}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=15}]"}]'
execute if entity @a[team=runners,scores={mh.uid=16}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=16}]"}]'
execute if entity @a[team=runners,scores={mh.uid=17}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=17}]"}]'
execute if entity @a[team=runners,scores={mh.uid=18}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=18}]"}]'
execute if entity @a[team=runners,scores={mh.uid=19}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=19}]"}]'
execute if entity @a[team=runners,scores={mh.uid=20}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=20}]"}]'
execute if entity @a[team=runners,scores={mh.uid=21}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=21}]"}]'
execute if entity @a[team=runners,scores={mh.uid=22}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=22}]"}]'
execute if entity @a[team=runners,scores={mh.uid=23}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=23}]"}]'
execute if entity @a[team=runners,scores={mh.uid=24}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=24}]"}]'
execute if entity @a[team=runners,scores={mh.uid=25}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=25}]"}]'
execute if entity @a[team=runners,scores={mh.uid=26}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=26}]"}]'
execute if entity @a[team=runners,scores={mh.uid=27}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=27}]"}]'
execute if entity @a[team=runners,scores={mh.uid=28}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=28}]"}]'
execute if entity @a[team=runners,scores={mh.uid=29}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=29}]"}]'
execute if entity @a[team=runners,scores={mh.uid=30}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=30}]"}]'

tellraw @s ["uid≤30的玩家: ",{"nbt":"TextCompound[]","storage": "mh:temp","interpret": true}]