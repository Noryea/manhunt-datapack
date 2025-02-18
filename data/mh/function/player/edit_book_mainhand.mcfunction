# 如果是空页直接返回
execute if items entity @s weapon.mainhand writable_book[minecraft:writable_book_content={"pages":[]}] run \
    return run advancement revoke @s only mh:detect/edit_book

# 验证非法字符
scoreboard players set #flag mh.temp 1
data modify storage mh:temp TextBuffer set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute store result score #len mh.temp run data get storage mh:temp TextBuffer
scoreboard players set #iter mh.temp 0
scoreboard players set #result mh.temp 1
function mh:compass/select/private/varify_char_foreach
execute if score #flag mh.temp matches 0 run tellraw @s "\u00a7c名称含有非法字符"


## 调用从书的内容读取id尝试选择的函数
data remove storage gu:main out
execute unless score #flag mh.temp matches 0 run \
    function mh:compass/select/writedown with entity @s SelectedItem.components."minecraft:writable_book_content".pages[0]

# early return 
execute unless data storage gu:main out run \
    item modify entity @s weapon.mainhand {function:"set_components",components:{"minecraft:writable_book_content":{pages:[]}}}
execute unless data storage gu:main out run \
    return run advancement revoke @s only mh:detect/edit_book

# lore
function mh:compass/util/construct_lore
# trackerData
data modify storage mh:temp trackerData set value {}
data modify storage mh:temp trackerData.selector set from storage gu:main out

item modify entity @s weapon.mainhand [\
    {function: "set_item", item: "compass"},\
    {function: "set_components", components: {"!minecraft:writable_book_content":{},"!minecraft:lore":{},"minecraft:max_stack_size": 1,"minecraft:lodestone_tracker":{}}},\
    {function: "reference",name:"mh:copy_lore_and_data"}]
function mh:compass/refresh/weapon_mainhand

# 让进度可以重新触发
advancement revoke @s only mh:detect/edit_book

