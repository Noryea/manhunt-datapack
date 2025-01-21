advancement revoke @s only use_remain_helper:detect/tick

# check hotbar event
scoreboard players operation #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot
execute store result score @s ur.hotbar.slot run data get entity @s SelectedItemSlot

execute unless score #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot \
    run function use_remain_helper:inventory_event