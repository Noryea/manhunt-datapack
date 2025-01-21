# 
execute if entity @s[team=runners] run tag @s add this
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 1 run team join hunters
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 2 run gamemode spectator @s
execute if entity @s[team=runners] if score 逃者死亡后 mh.settings matches 2 run team leave @s

# 显示死亡大标题
execute if entity @s[tag=this] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a times 10 70 20
execute if entity @s[tag=this] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a subtitle "所有逃者已阵亡"
execute if entity @s[tag=this] if score 逃者死亡后 mh.settings matches 1..2 unless entity @a[team=runners] run title @a title {"text":"猎人胜利!","color":"red"}

tag @s remove this

scoreboard players set @s mh.died.listener 0