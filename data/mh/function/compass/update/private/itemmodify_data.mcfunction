# @args: {slot: 槽位, customData: 物品组件复合标签, lore: 物品提示文字列表}

$return run item modify entity @s $(slot) [\
  {\
    function: "minecraft:set_lore",\
    lore: $(lore),\
    mode: "replace_all"\
  },\
  {\
    function: "minecraft:set_custom_data",\
    tag: $(customData)\
  }\
]