# @args: {out: the GUUID of player}
# @output 在 mh:temp 写入 latestPos:{"out":{pos:[x,y,z], dimension:"xxx"}}

# 更新数值
$data modify storage mh:temp latestPos."$(out)".pos set from entity @s Pos
$execute unless data storage mh:temp latestPos."$(out)".dimension run \
    data modify storage mh:temp latestPos."$(out)".dimension set from entity @s Dimension
