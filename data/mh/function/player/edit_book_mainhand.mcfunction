# 如果是空页直接返回
execute if items entity @s weapon.mainhand writable_book[minecraft:writable_book_content={"pages":[]}] run \
    return run advancement revoke @s only mh:detect/edit_book

# remove "out" nbt
data remove storage gu:main out

# 如果输入参数含非法字符, 报错
execute store result score #flag mh.temp run \
    function mh:compass/select/private/varify_name_str with entity @s SelectedItem.components."minecraft:writable_book_content".pages[0]
execute if score #flag mh.temp matches 0 run \
    tellraw @s "\u00a7c名称含有非法字符"
    
# 
execute unless score #flag mh.temp matches 0 run \
    function mh:compass/select/writedown with entity @s SelectedItem.components."minecraft:writable_book_content".pages[0]

# early return 
execute unless data storage gu:main out run \
    item modify entity @s weapon.mainhand {function:"set_components",components:{"minecraft:writable_book_content":{pages:[]}}}
execute unless data storage gu:main out run \
    return run advancement revoke @s only mh:detect/edit_book

# loreText
function mh:compass/util/construct_lore
# trackerData
data modify storage mh:temp trackerData set value {}
data modify storage mh:temp trackerData.selector set from storage gu:main out

item modify entity @s weapon.mainhand [{function:"set_components",components:{"!minecraft:writable_book_content":{}}},{function:"set_name",name:{"text":"追踪器","color":"white","italic": false}},{function: "set_item", item: "compass"},{function: "set_components", components: {"!minecraft:enchantment_glint_override":{}}}]
item modify entity @s weapon.mainhand mh:copy_lore_and_data
function mh:compass/refresh/weapon_mainhand

# 让进度可以重新触发
advancement revoke @s only mh:detect/edit_book

