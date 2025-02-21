# @args: {slot, cooldownSec}
# 如果更新模式不是右键，禁用指南针右键
$execute unless score 追踪器:更新模式 mh.settings matches 0 run \
    return run item modify entity @s $(slot) mh:make_unusable

# 否则启用指南针右键并设置使用冷却
$item modify entity @s $(slot) mh:make_usable
$execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run \
    return run item modify entity @s $(slot) {function:"set_components",components:{"use_cooldown":{seconds:0.01}}}
$item modify entity @s $(slot) {function:"set_components",components:{"use_cooldown":{seconds:$(cooldownSec),cooldown_group:"mh:tracker"}}}

