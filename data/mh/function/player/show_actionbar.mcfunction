# 让进度可以再触发
advancement revoke @s only mh:detect/show_actionbar

# 如果切换后发现玩家手上没有指南针，立即清空动作栏
execute unless items entity @s weapon.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    return run title @s actionbar ""

function mh:player/actionbar/parse_hand_item
# 复制guuid作为实体选择器文本组件
data modify storage mh:temp in.selectorText set value {selector:""}
data modify storage mh:temp in.selectorText.selector set from storage mh:temp trackerData.selector
# 判断是否为队友
scoreboard players set #flag mh.temp -1
execute store result score #flag mh.temp run function mh:player/actionbar/if_teammate with storage mh:temp trackerData
# 构造actionBarExtra
data modify storage mh:temp actionBarExtra set value []
execute if score #flag mh.temp matches 0 run function mh:player/actionbar/construct_enemy_info
execute if score #flag mh.temp matches 1 run function mh:player/actionbar/construct_teammate_info

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

