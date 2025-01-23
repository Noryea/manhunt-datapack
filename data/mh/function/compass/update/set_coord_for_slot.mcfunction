# @args: {Target: 磁石位置复合标签, Slot: string}

$return run item modify entity @s $(Slot) { "function": "minecraft:set_components", "components": \
    {"minecraft:lodestone_tracker": {"target": $(Target),"tracked": false} } \
}
