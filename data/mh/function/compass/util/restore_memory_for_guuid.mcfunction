# @executor: 掉落物实体
# @args: {selected: 要读取物品记忆的玩家选择器}
$data modify entity @s Item.components."minecraft:custom_data"."mh:tracker".info \ 
    set from entity @s Item.components."minecraft:custom_data"."mh:tracker".memories."$(selector)".info
$data modify entity @s Item.components."minecraft:lodestone_tracker".target \
    set from entity @s Item.components."minecraft:custom_data"."mh:tracker".memories."$(selector)".target
data modify entity @s Item.components."minecraft:lodestone_tracker".tracked set value false