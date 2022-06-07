tag @s add self

execute if entity @s[team=hunters] run tag @a[team=runners,gamemode=!spectator] add trackable
execute if entity @s[team=hunters] if score 可追踪队友 mh.settings matches 1 run tag @a[team=hunters,gamemode=!spectator,tag=!self] add trackable
execute if entity @s[team=runners] if score 可追踪队友 mh.settings matches 1 run tag @a[team=runners,gamemode=!spectator,tag=!self] add trackable

tag @s remove self

data merge storage mh:temp {TextCompound:[]}
#仅到30个
execute if entity @a[tag=trackable,scores={mh.uid=1}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=1}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 1"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=2}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=2}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 2"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=3}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=3}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 3"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=4}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=4}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 4"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=5}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=5}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 5"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=6}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=6}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 6"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=7}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=7}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 7"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=8}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=8}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 8"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=9}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=9}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 9"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=10}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=10}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 10"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=11}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=11}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 11"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=12}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=12}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 12"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=13}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=13}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 13"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=14}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=14}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 14"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=15}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=15}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 15"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=16}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=16}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 16"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=17}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=17}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 17"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=18}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=18}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 18"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=19}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=19}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 19"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=20}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=20}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 20"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=21}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=21}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 21"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=22}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=22}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 22"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=23}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=23}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 23"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=24}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=24}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 24"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=25}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=25}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 25"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=26}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=26}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 26"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=27}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=27}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 27"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=28}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=28}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 28"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=29}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=29}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 29"}}]'
execute if entity @a[tag=trackable,scores={mh.uid=30}] run data modify storage mh:temp TextCompound append value '["",{"selector":"@p[scores={mh.uid=30}]","clickEvent":{"action":"run_command","value":"/trigger mh.tracking set 30"}}]'

tellraw @s ["所有可选目标: ",{"nbt":"TextCompound[]","storage": "mh:temp","interpret": true}]

data remove storage mh:temp TextCompound
tag @a remove trackable