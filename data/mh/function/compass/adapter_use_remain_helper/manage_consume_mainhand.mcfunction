data modify storage mh:temp in.slot set value "weapon.mainhand"
execute store result storage mh:temp in.cooldownSec float 0.05 run scoreboard players get 追踪器:右键更新周期游戏刻 mh.settings
execute if score 追踪器:右键更新周期游戏刻 mh.settings matches 0 run \
    data modify storage mh:temp in.cooldownSec set value 0.001
function mh:compass/util/itemmodify_rightclick with storage mh:temp in