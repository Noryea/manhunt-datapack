#> 用于修改设置后立即修改玩家背包所有追踪器的物品描述文字
execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail

execute if items entity @s container.0 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.0 mh:update_lore
execute if items entity @s container.1 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.1 mh:update_lore
execute if items entity @s container.2 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.2 mh:update_lore
execute if items entity @s container.3 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.3 mh:update_lore
execute if items entity @s container.4 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.4 mh:update_lore
execute if items entity @s container.5 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.5 mh:update_lore
execute if items entity @s container.6 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.6 mh:update_lore
execute if items entity @s container.7 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.7 mh:update_lore
execute if items entity @s container.8 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.8 mh:update_lore
execute if items entity @s container.9 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.9 mh:update_lore
execute if items entity @s container.10 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.10 mh:update_lore
execute if items entity @s container.11 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.11 mh:update_lore
execute if items entity @s container.12 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.12 mh:update_lore
execute if items entity @s container.13 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.13 mh:update_lore
execute if items entity @s container.14 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.14 mh:update_lore
execute if items entity @s container.15 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.15 mh:update_lore
execute if items entity @s container.16 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.16 mh:update_lore
execute if items entity @s container.17 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.17 mh:update_lore
execute if items entity @s container.18 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.18 mh:update_lore
execute if items entity @s container.19 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.19 mh:update_lore
execute if items entity @s container.20 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.20 mh:update_lore
execute if items entity @s container.21 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.21 mh:update_lore
execute if items entity @s container.22 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.22 mh:update_lore
execute if items entity @s container.23 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.23 mh:update_lore
execute if items entity @s container.24 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.24 mh:update_lore
execute if items entity @s container.25 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.25 mh:update_lore
execute if items entity @s container.26 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.26 mh:update_lore
execute if items entity @s container.27 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.27 mh:update_lore
execute if items entity @s container.28 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.28 mh:update_lore
execute if items entity @s container.29 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.29 mh:update_lore
execute if items entity @s container.30 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.30 mh:update_lore
execute if items entity @s container.31 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.31 mh:update_lore
execute if items entity @s container.32 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.32 mh:update_lore
execute if items entity @s container.33 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.33 mh:update_lore
execute if items entity @s container.34 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.34 mh:update_lore
execute if items entity @s container.35 compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s container.35 mh:update_lore
execute if items entity @s weapon.offhand compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s weapon.offhand mh:update_lore
execute if items entity @s player.cursor compass[minecraft:custom_data~{"mh:tracker":{}}] run item modify entity @s player.cursor mh:update_lore
