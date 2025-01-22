# @args {Target: {pos: [I;x,y,z], dimension: string}, Slot: string}
$return run item modify entity @s $(Slot) { "function": "minecraft:set_components", "components": \
    {"minecraft:lodestone_tracker": {"target": $(Target),"tracked": false} } \
}
