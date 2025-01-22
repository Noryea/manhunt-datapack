# @executor: 掉落物实体
# @args: {selector: 要保存到物品记忆的玩家选择器}
$data remove entity @s Item.components."minecraft:custom_data"."mh:tracker".memories."$(selector)"
$data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".memories."$(selector)".info set \
    from entity @s Item.components."minecraft:custom_data"."mh:tracker".info
$data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".memories."$(selector)".target set \
    from entity @s Item.components."minecraft:lodestone_tracker".target