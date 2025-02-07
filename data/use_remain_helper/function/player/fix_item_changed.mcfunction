execute if items entity @s weapon.mainhand *[minecraft:custom_data~{"ur:remaining_flag":true}] run \
    function #use_remain_helper:set_mainhand

execute if items entity @s weapon.offhand *[minecraft:custom_data~{"ur:remaining_flag":true}] run \
    function #use_remain_helper:set_offhand

advancement revoke @s only use_remain_helper:detect/fix_item_changed