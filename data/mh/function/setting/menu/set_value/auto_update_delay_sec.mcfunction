## @input {Value: int}

# 储存旧值
scoreboard players operation #old_value mh.temp = 追踪器:定期更新周期秒数 mh.settings

# 假设值合法
$scoreboard players set 追踪器:定期更新周期秒数 mh.settings $(Value)

# 判断是否合法，合法才会更新显示
execute if score 追踪器:定期更新周期秒数 mh.settings matches 1.. run function #mh:menu

# 不合法则打印错误信息，并恢复更改
execute unless score 追踪器:定期更新周期秒数 mh.settings matches 1.. run \
    tellraw @s {"text":"命令发生错误：不合法的数据范围，\"追踪器:定期更新周期秒数\"选项的数值必须为正整数", "color": "red"}
execute unless score 追踪器:定期更新周期秒数 mh.settings matches 1.. run \
    scoreboard players operation 追踪器:定期更新周期秒数 mh.settings = #old_value mh.temp



