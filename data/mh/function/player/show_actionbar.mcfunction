# 让进度可以再触发
advancement revoke @s only mh:detect/show_actionbar

# early return
execute unless entity @s[team=hunters] unless entity @s[team=runners] run return fail
execute if entity @s[gamemode=spectator] run return fail

# 如果切换后发现玩家手上没有指南针, 立即清空动作栏并终止
execute unless items entity @s weapon.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return run title @s actionbar ""

# 读取手上(主手优先于副手)物品的数据
function mh:player/actionbar/parse_hand_item
# 没有selector, 直接终止
execute unless data storage mh:temp trackerData.selector run return fail

# 判断是否为队友
scoreboard players set #flag mh.temp -1
execute store result score #flag mh.temp run function mh:player/actionbar/if_teammate with storage mh:temp trackerData
# 复制guuid作为实体选择器文本组件
data modify storage mh:temp in.selectorText set value {}
execute if score #flag mh.temp matches 0 if entity @s[team=hunters] if score 猎人可追踪:敌人 mh.settings matches 1 run \
    data modify storage mh:temp in.selectorText.selector set from storage mh:temp trackerData.selector
execute if score #flag mh.temp matches 0 if entity @s[team=runners] if score 逃者可追踪:敌人 mh.settings matches 1 run \
    data modify storage mh:temp in.selectorText.selector set from storage mh:temp trackerData.selector
execute if score #flag mh.temp matches 1 if entity @s[team=hunters] if score 猎人可追踪:队友 mh.settings matches 1 run \
    data modify storage mh:temp in.selectorText.selector set from storage mh:temp trackerData.selector
execute if score #flag mh.temp matches 1 if entity @s[team=runners] if score 逃者可追踪:队友 mh.settings matches 1 run \
    data modify storage mh:temp in.selectorText.selector set from storage mh:temp trackerData.selector
execute unless data storage mh:temp in.selectorText.selector run data modify storage mh:temp in.selectorText set value {text:"未知",color:"gray"}

# 构造actionBarExtra
data modify storage mh:temp actionBarExtra set value []
execute if score #flag mh.temp matches 0 if entity @s[team=hunters] if score 猎人可追踪:敌人 mh.settings matches 1 run function mh:player/actionbar/construct_enemy_info
execute if score #flag mh.temp matches 0 if entity @s[team=runners] if score 逃者可追踪:敌人 mh.settings matches 1 run function mh:player/actionbar/construct_enemy_info
execute if score #flag mh.temp matches 1 if entity @s[team=hunters] if score 猎人可追踪:队友 mh.settings matches 1 run function mh:player/actionbar/construct_teammate_info
execute if score #flag mh.temp matches 1 if entity @s[team=runners] if score 逃者可追踪:队友 mh.settings matches 1 run function mh:player/actionbar/construct_teammate_info

# 执行title指令
execute if data storage mh:temp actionBarExtra[] run title @s actionbar [ \
    {"text":"目标:"},\
    {"nbt": "in.selectorText", "storage": "mh:temp", "interpret": true, "extra": [\
            {"text":" (","color":"white"}, \
            {"nbt":"actionBarExtra[]","storage":"mh:temp","interpret":true,"separator":" "}, \
            {"text":")","color":"white"} \
        ] \
    } \
]
execute unless data storage mh:temp actionBarExtra[] run title @s actionbar [{"text":"目标: "},{"nbt": "in.selectorText", "storage": "mh:temp", "interpret": true}]

