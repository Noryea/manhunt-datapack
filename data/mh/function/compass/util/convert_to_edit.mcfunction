# @args: {slot: 要转换为书与笔的槽位}
$execute if items entity @s $(slot) compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    item modify entity @s $(slot) {function:"set_item",item:"writable_book"}