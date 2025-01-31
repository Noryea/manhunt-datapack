# 如果玩家死亡，直接返回
execute if data entity @s {Health:0.0f} run \
    return run advancement revoke @s only mh:detect/inventory_changed

# 如果玩家不属于猎人或逃者，直接返回
execute if entity @s[team=!hunters,team=!runners] run \
    return run advancement revoke @s only mh:detect/inventory_changed

## 给予指南针 & 检测丢弃
scoreboard players set #can_have_compass mh.temp 1
execute if entity @s[team=hunters] unless score 猎人可追踪:敌人 mh.settings matches 1 unless score 猎人可追踪:队友 mh.settings matches 1 run \
    scoreboard players set #can_have_compass mh.temp 0
execute if entity @s[team=runners] unless score 逃者可追踪:敌人 mh.settings matches 1 unless score 逃者可追踪:队友 mh.settings matches 1 run \
    scoreboard players set #can_have_compass mh.temp 0
execute if entity @s[team=runners] store result score #runners_count mh.temp if entity @a[team=runners,gamemode=!spectator]
execute if entity @s[team=runners] if score 逃者可追踪:敌人 mh.temp matches 1 unless score #runners_count mh.temp matches 2.. run \
    scoreboard players set #can_have_compass mh.temp 0

# 检测指南针丢弃
execute if score #can_have_compass mh.temp matches 1 run scoreboard players set #compass_dropped mh.temp 0
execute if score #can_have_compass mh.temp matches 1 anchored eyes positioned ^ ^ ^ as @n[type=item,distance=..6] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] \
    store result score #compass_dropped mh.temp run function mh:compass/prevent_drop

# 判断玩家没有丢指南针，防止重复给予
execute if score #can_have_compass mh.temp matches 1 if score #compass_dropped mh.temp matches 0 unless function mh:compass/util/if_have_compass run \
    give @s[gamemode=!spectator] compass[minecraft:max_stack_size=1, minecraft:item_name='{"text":"追踪器","color":"white"}', minecraft:rarity="common",minecraft:enchantments={levels:{"minecraft:vanishing_curse":1},show_in_tooltip:false}, minecraft:enchantment_glint_override=true, minecraft:custom_data={"mh:tracker":{}},minecraft:lodestone_tracker={}]

   
## 杀掉未捡起的指南针实体
execute as @e[type=item,distance=..6,tag=!mh.item.pick] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    kill @s


## 让进度可以重新触发
advancement revoke @s only mh:detect/inventory_changed