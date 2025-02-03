#args: {target}

loot give @s loot \
{ \
  "type": "minecraft:generic", \
  "pools": [ \
    { \
      "rolls": 1, \
      "entries": [ \
        { \
          "type": "minecraft:item", \
          "name": "minecraft:compass", \
          "functions": [ \
            { \
              "function": "minecraft:reference", \
              "name": "mh:tracker_basic" \
            }, \
            { \
              "function": "minecraft:reference", \
              "name": "mh:copy_lore_and_data" \
            } \
          ] \
        } \
      ] \
    } \
  ] \
}