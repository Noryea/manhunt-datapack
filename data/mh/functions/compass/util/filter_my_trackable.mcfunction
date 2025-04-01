#> 筛选出可追踪的玩家，附上mh.trackable标签
tag @s add this1

execute if entity @s[team=hunters] if score 猎人可追踪:队友 mh.settings matches 1 run \
    tag @a[team=hunters,gamemode=!spectator,tag=!this1] add mh.trackable
execute if entity @s[team=hunters] if score 猎人可追踪:敌人 mh.settings matches 1 run \
    tag @a[team=runners,gamemode=!spectator] add mh.trackable

execute if entity @s[team=runners] if score 逃者可追踪:队友 mh.settings matches 1 run \
    tag @a[team=runners,gamemode=!spectator,tag=!this1] add mh.trackable
execute if entity @s[team=runners] if score 逃者可追踪:敌人 mh.settings matches 1 run \
    tag @a[team=hunters,gamemode=!spectator] add mh.trackable

tag @s remove this1