data modify storage mh:temp trackerData set value {}
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
                "minecraft:lodestone_tracker": {} \
              } \
            } \
          ] \
        } \
      ] \
    } \
  ] \
}
execute unless entity @s[team=hunters] unless entity @s[team=runners] run \
    return fail
execute if score 追踪器:更新模式 mh.settings matches 2 if score 追踪器:手持激活模式 mh.settings matches 1 run \
    return fail
# 更新全背包
execute if items entity @s container.* compass[minecraft:custom_data~{"mh:tracker":{}}] run \
    function mh:compass/refresh/inventory