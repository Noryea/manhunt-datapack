execute if entity @s[team=runners] run \
    tag @s add was_runner

# 判断逃者死亡    
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 1 run team join hunters
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 2 run gamemode spectator @s
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 2 run team leave @s

# 显示死亡大标题
execute if entity @s[tag=was_runner] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a times 8 70 20
execute if entity @s[tag=was_runner] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a subtitle "所有逃者已阵亡"
execute if entity @s[tag=was_runner] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a title {"text":"猎人胜利!","color":"red"}

tag @s remove was_runner

# 让进度可以重新触发
advancement revoke @s only mh:detect/die