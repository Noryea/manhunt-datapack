# 如果玩家死亡，直接返回
execute if data entity @s {Health:0.0f} run \
    return run advancement revoke @s only mh:detect/inventory_changed

# 如果玩家不属于猎人或逃者，直接返回
execute if entity @s[team=!hunters,team=!runners] run \
    return run advancement revoke @s only mh:detect/inventory_changed

scoreboard players set #can_have_compass mh.temp 1
execute if entity @s[team=hunters] unless score 猎人可追踪:敌人 mh.settings matches 1 unless score 猎人可追踪:队友 mh.settings matches 1 run \
    scoreboard players set #can_have_compass mh.temp 0
execute if entity @s[team=runners] store result score #runners_count mh.temp if entity @a[team=runners,gamemode=!spectator]
execute if entity @s[team=runners] unless score 逃者可追踪:敌人 mh.settings matches 1 unless score 逃者可追踪:队友 mh.settings matches 1 run \
    scoreboard players set #can_have_compass mh.temp 0
execute if entity @s[team=runners] unless score 逃者可追踪:敌人 mh.settings matches 1 if score 逃者可追踪:队友 mh.settings matches 1 unless score #runners_count mh.temp matches 2.. run \
    scoreboard players set #can_have_compass mh.temp 0
# 如果不应该拥有指南针，清除指南针并直接返回
execute if score #can_have_compass mh.temp matches 0 run clear @s *[minecraft:custom_data~{"mh:tracker":{}}]
execute if score #can_have_compass mh.temp matches 0 run \
    return run advancement revoke @s only mh:detect/inventory_changed


## 给予指南针 & 检测丢弃
# 检测指南针丢弃
execute if score #can_have_compass mh.temp matches 1 anchored eyes positioned ^ ^ ^ as @n[type=item,distance=..6,tag=!mh.item.pick] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    function mh:compass/prevent_drop

# 判断玩家没有丢指南针，防止重复给予
execute if entity @s[gamemode=!spectator] if score #can_have_compass mh.temp matches 1 unless entity @e[type=item,distance=..6,tag=mh.item.pick] unless function mh:compass/util/if_have_item run \
    function mh:compass/give

   
## 杀掉未捡起的指南针实体
execute as @e[type=item,distance=..6,tag=!mh.item.pick] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    kill @s


## 标记玩家指针槽位指南针和副手槽位指南针标签
# (优先度应低于背包事件,否则无效)
execute if items entity @s weapon.offhand *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s add mh.offhand.compass
execute unless items entity @s weapon.offhand *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s remove mh.offhand.compass
execute if items entity @s player.cursor *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s add mh.cursor.compass
execute unless items entity @s player.cursor *[minecraft:custom_data~{"mh:tracker":{}}] \
    run tag @s remove mh.cursor.compass


## 让进度可以重新触发
advancement revoke @s only mh:detect/inventory_changed