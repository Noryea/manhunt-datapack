# @args: {x:int, y:int, z:int}
# @output: 在 mh:temp 存入 out: float

execute unless entity @s[type=item_display] run \
    return fail
$data modify entity @s transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
data modify storage mh:temp out set from entity @s transformation.scale[0]
tellraw @a {"nbt":"transformation.scale[0]","entity": "@s"}
kill @s