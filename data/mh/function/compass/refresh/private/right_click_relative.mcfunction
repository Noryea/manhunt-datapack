# @args: {slot} 在mh:temp

data modify storage mh:temp in.modifier set value [\
    {function:"reference", name:"mh:make_usable"},\
]

# 如果更新模式不是右键，禁用指南针右键
execute unless score 追踪器:更新模式 mh.settings matches 0 run data modify storage mh:temp in.modifier[0].name set value "mh:make_unusable"
execute unless score 追踪器:更新模式 mh.settings matches 0 run \
    return run function mh:compass/refresh/private/__itemmodify with storage mh:temp in

# 否则启用指南针右键并设置使用冷却
data modify storage mh:temp in.modifier append value {\
    function: "set_components",\
    components: {"minecraft:use_cooldown": {seconds: 0.01}}\
}
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 1.. store result storage mh:temp in.modifier[1].components."minecraft:use_cooldown".seconds float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
function mh:compass/refresh/private/__itemmodify with storage mh:temp in
