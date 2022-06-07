# 猎人函数
execute as @a[team=hunters] at @s run function mh:players/hunters/main

# 逃者
execute as @a[team=runners] at @s run function mh:players/runners/main

#
schedule function mh:keep_every_10t 10t replace