#
# 信息类: lore组件 实际维度exactDimension、
# 变量类: selector
#
#
## 给予指南针 & 检测丢弃
# 如果玩家应该拥有指南针,先执行防止丢弃的函数(包括丢弃事件)
# 只有在没有触发丢弃事件时,才判断是否应该补充指南针
execute if entity @s[team=hunters] if function mh:player/hunters_can_have_compass \
    unless function mh:player/detect_drop \
        unless function mh:player/have_compass \
            run give @s[gamemode=!spectator] \
            compass[\
                minecraft:max_stack_size=1, \
                minecraft:item_name='{"text":"追踪器","color":"white"}', \
                minecraft:rarity="common",\
                minecraft:enchantments={levels:{"minecraft:vanishing_curse":1},show_in_tooltip:false}, \
                minecraft:enchantment_glint_override=true, \
                minecraft:custom_data={"mh:tracker":{}},\
                minecraft:lodestone_tracker={}\
            ]

execute if entity @s[team=runners] if function mh:player/runners_can_have_compass \
    unless function mh:player/detect_drop \
        unless function mh:player/have_compass \
            run give @s[gamemode=!spectator] \
            compass[\
                minecraft:max_stack_size=1, \
                minecraft:item_name='{"text":"追踪器","color":"white"}', \
                minecraft:rarity="common",\
                minecraft:enchantments={levels:{"minecraft:vanishing_curse":1},show_in_tooltip:false}, \
                minecraft:enchantment_glint_override=true, \
                minecraft:custom_data={"mh:tracker":{}},\
                minecraft:lodestone_tracker={}\
            ]
    
# 杀掉指南针实体
execute as @e[type=item,distance=..6,tag=!mh.item.pick] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    kill @s