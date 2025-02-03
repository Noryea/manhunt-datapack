# @args: {out: the GUUID of player}
# @output 在 mh:temp 写入 lastPos:{"out":{pos:[x,y,z], dimension:"xxx"}}

# 更新数值
$data modify storage mh:temp lastPos."$(out)".pos set from entity @s Pos
$execute unless data storage mh:temp lastPos."$(out)".dimension run \
    data modify storage mh:temp lastPos."$(out)".dimension set from entity @s Dimension
