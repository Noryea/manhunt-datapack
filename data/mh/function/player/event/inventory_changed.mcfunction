execute store result score #gametime mh.temp run time query daytime
tellraw @a ["gametime: ", {"score": {"name": "#gametime","objective": "mh.temp"}}]
## 给予指南针
# 如果玩家应该拥有指南针,先执行防止丢弃的函数(包括丢弃事件)
# 只有在没有触发丢弃事件时,才判断是否应该补充指南针
execute if entity @s[team=hunters] if function mh:player/hunters_can_have_compass \
    unless function mh:player/avoid_drop \
        unless function mh:player/have_compass \
            run give @s compass[minecraft:custom_data={"mh:tracker":{}},minecraft:enchantment_glint_override=true]

execute if entity @s[team=runners] if function mh:player/runners_can_have_compass \
    unless function mh:player/avoid_drop \
        unless function mh:player/have_compass \
            run give @s compass[minecraft:custom_data={"mh:tracker":{}},minecraft:enchantment_glint_override=true]

# execute as @n[type=item,distance=0..5] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] \
    run data modify entity @s Age set value 5998s
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{"mh:tracker":{}}] run \
    tag @s add mh.mainhand.compass
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{"mh:tracker":{}}] run \
    tag @s remove mh.mainhand.compass
    
# 让进度可以重新触发
advancement revoke @s only mh:detect/inventory_changed