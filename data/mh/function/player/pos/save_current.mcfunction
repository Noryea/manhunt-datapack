# @args: {out: the GUUID of player}
# @output 在 mh:temp 写入 LastPos:{"out":{pos:[x,y,z], dimension:"xxx"}}

# 更新数值
$data modify storage mh:temp LastPos."$(out)".pos set from entity @s Pos
$data modify storage mh:temp LastPos."$(out)".dimension set from entity @s Dimension
