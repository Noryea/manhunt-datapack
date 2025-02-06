#args: {guuid, target}
$data modify storage mh:temp trackerData.info.exactDimension set from entity $(guuid) Dimension
$loot give @s loot \
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
            }, \
            { \
              "function": "minecraft:set_components", \
              "components": { \
                "minecraft:lodestone_tracker": { \
                  "target": $(target), \
                  "tracked": false \
                } \
              } \
            } \
          ] \
        } \
      ] \
    } \
  ] \
}