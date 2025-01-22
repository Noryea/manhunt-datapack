# @args {UUID}
# @output {LastPos:{"UUID":{Pos:[x,x,x], Dimension:"xxx"}}}

# pos不存在时,构造pos数组
$execute unless data storage mh:temp LastPos."$(UUID)".pos run data modify storage mh:temp LastPos."$(UUID)".pos set value [I;0,0,0]
# 更新数值
$data modify storage mh:temp LastPos."$(UUID)".pos[0] set from entity @s Pos[0]
$data modify storage mh:temp LastPos."$(UUID)".pos[1] set from entity @s Pos[1]
$data modify storage mh:temp LastPos."$(UUID)".pos[2] set from entity @s Pos[2]
$data modify storage mh:temp LastPos."$(UUID)".dimension set from entity @s Dimension
