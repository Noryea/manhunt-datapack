# 让进度可以重新触发
scoreboard players set @s mh.died.listener 0
advancement revoke @s only mh:detect/die

execute unless entity @s[team=runners] run return fail
# 判断末影龙未死亡（如果启用）
execute if score 检测末影龙死亡 mh.settings matches 1 if score 末影龙已死亡 mh.temp matches 1 run return fail

# 判断逃者死亡
execute if score 逃者死亡后 mh.settings matches 1 run team join hunters
execute if score 逃者死亡后 mh.settings matches 2 run gamemode spectator @s
execute if score 逃者死亡后 mh.settings matches 2 run team leave @s

# 显示死亡大标题
execute if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a times 8 70 20
execute if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a subtitle "所有逃者已阵亡"
execute if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a title {"text":"猎人胜利!","color":"red"}