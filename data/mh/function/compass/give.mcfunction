data remove storage mh:temp in
data modify storage mh:temp trackerData set value {}

function mh:compass/util/filter_my_trackable
# mark first trackable player
tag @a[limit=1,sort=arbitrary,tag=mh.trackable] add mh.track
tag @a remove mh.trackable

# 如果没有可追踪的玩家
execute unless entity @a[tag=mh.track] run \
    return run loot give @s loot \
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
              "function": "minecraft:copy_custom_data", \
              "source": { \
                "type": "minecraft:storage", \
                "source": "mh:temp" \
              }, \
              "ops": [ \
                { \
                  "source": "trackerData", \
                  "target": "mh:tracker", \
                  "op": "merge" \
                } \
              ] \
            }, \
            { \
              "function": "minecraft:set_components", \
              "components": { \
                "minecraft:lodestone_tracker": { \
                  "target": {pos:[I;0,-64,0],dimension:"minecraft:overworld"}, \
                  "tracked": true \
                } \
              } \
            } \
          ] \
        } \
      ] \
    } \
  ] \
}


# 有可追踪的玩家
execute as @a[tag=mh.track,limit=1] run function mh:gu/generate
data modify storage mh:temp in.guuid set from storage gu:main out
data modify storage mh:temp in.dimension set from entity @s Dimension
data modify storage mh:temp in.target set value {pos:[I;0,-64,0],dimension:"minecraft:overworld"}
execute unless score 追踪器:更新模式 mh.settings matches 3 \
    as @a[tag=mh.track,limit=1] run function mh:player/pos/get

# itemInfoText
function mh:compass/util/construct_lore

# trackerData
data modify storage mh:temp trackerData.selector set from storage mh:temp in.guuid

# 带参的物品修饰器
execute if data storage gu:main out run function mh:compass/util/itemgive with storage mh:temp in

tag @a remove mh.track
