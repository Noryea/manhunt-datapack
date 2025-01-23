# @args: {slot: 槽位, target: 磁石位置复合标签}

$return run item modify entity @s $(slot) { "function": "minecraft:set_components", "components": \
    {"minecraft:lodestone_tracker": {"target": $(target),"tracked": false} } \
}
