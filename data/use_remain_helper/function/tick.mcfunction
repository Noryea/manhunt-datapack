advancement revoke @s only use_remain_helper:detect/tick

# check hotbar event
scoreboard players operation #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot
execute store result score @s ur.hotbar.slot run data get entity @s SelectedItemSlot

execute unless score #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot \
    run function #use_remain_helper:when_hotbar_scroll

# inventory changed
execute if entity @s[advancements={use_remain_helper:detect/testfor_mainhand_flag=true}] \
    unless function #use_remain_helper:set_mainhand run advancement revoke @s only use_remain_helper:detect/testfor_mainhand_flag
execute if entity @s[advancements={use_remain_helper:detect/testfor_offhand_flag=true}] \
    unless function #use_remain_helper:set_offhand run advancement revoke @s only use_remain_helper:detect/testfor_offhand_flag