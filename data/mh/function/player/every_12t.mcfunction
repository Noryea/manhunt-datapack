# 缓存一次最新坐标（用于跨维度追踪）
execute unless entity @s[advancements={mh:detect/changed_dimension=true}] \
    unless function mh:gu/generate run function mh:player/pos/sync_current with storage gu:main

# 选队触发器
scoreboard players enable @s mh.join.hunters
execute if score @s mh.join.hunters matches 1.. if score 允许自由选队 mh.settings matches 0 run tellraw @s "\u00a7c系统设置不允许自由选队, 请使用/team join [队伍] [玩家名字]"
execute if score @s[team=!hunters] mh.join.hunters matches 1.. unless score 允许自由选队 mh.settings matches 0 run team join hunters
scoreboard players set @s mh.join.hunters 0

scoreboard players enable @s mh.join.runners
execute if score @s mh.join.runners matches 1.. if score 允许自由选队 mh.settings matches 0 run tellraw @s "\u00a7c系统设置不允许自由选队, 请使用/team join [队伍] [玩家名字]"
execute if score @s[team=!runners] mh.join.runners matches 1.. unless score 允许自由选队 mh.settings matches 0 run team join runners
scoreboard players set @s mh.join.runners 0

# 进度界面区分队伍
execute if entity @s[team=hunters] run advancement grant @s only mh:gui/hunter
execute if entity @s[team=hunters] run advancement revoke @s only mh:gui/runner
execute if entity @s[team=runners] run advancement grant @s only mh:gui/runner
execute if entity @s[team=runners] run advancement revoke @s only mh:gui/hunter

# 死亡记分项重置
execute if score @s[nbt=!{Health:0.0f}] mh.died.listener matches 1.. run scoreboard players set @s mh.died.listener 0

# 让进度可以重新触发
advancement revoke @s only mh:detect/tick_12t