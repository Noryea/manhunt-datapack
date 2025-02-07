advancement revoke @s only use_remain_helper:detect/tick

# check hotbar event
scoreboard players operation #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot
execute store result score @s ur.hotbar.slot run data get entity @s SelectedItemSlot

execute unless score #old_hotbar_slot ur.hotbar.slot = @s ur.hotbar.slot \
    run function #use_remain_helper:when_hotbar_scroll

# execute advancement post consume trigger
execute if entity @s[advancements={use_remain_helper:detect/use_mainhand=true}] run function use_remain_helper:player/use_mainhand
execute if entity @s[advancements={use_remain_helper:detect/use_offhand=true}] run function use_remain_helper:player/use_offhand