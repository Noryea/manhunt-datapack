# >判断猎人是否应该补充指南针

# 统计猎人人数
execute store result score #hunters_count mh.temp if entity @a[team=hunters]

# 可追踪队友且队伍人数超过2
execute if score 猎人可追踪:队友 mh.settings matches 1 if score #hunters_count mh.temp matches 2.. run \
    return 1
# 可追踪敌人且有敌人
#execute if score 猎人可追踪:敌人 mh.settings matches 1 if entity @a[team=runners] run \
    return 1
# 可追踪敌人
execute if score 猎人可追踪:敌人 mh.settings matches 1 run \
    return 1
# 都没通过判断则返回0
return fail