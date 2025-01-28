# 当玩家指针放下物品时也触发一次背包事件
# 比如当玩家把物品放到合成格/从容器ui旁边左键丢弃
execute unless items entity @s player.cursor * run function mh:player/inventory_changed

# 标记玩家指针指南针标签
# (优先度应低于背包事件,否则无效)
execute if items entity @s player.cursor *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s add mh.cursor.compass
execute unless items entity @s player.cursor *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s remove mh.cursor.compass

# 让进度可以重新触发
advancement revoke @s only mh:detect/cursor_compass_changed