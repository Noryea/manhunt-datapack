# 当玩家指针放下物品时也触发一次背包事件
# 比如当玩家把物品放到合成格/从容器ui旁边左键丢弃
execute unless items entity @s player.cursor * run function mh:player/event/inventory_changed

# 让进度可以重新触发
advancement revoke @s only mh:detect/cursor_compass_changed