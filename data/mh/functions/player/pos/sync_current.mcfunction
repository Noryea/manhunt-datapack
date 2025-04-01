# @args: {out: the GUUID of player}
# @output 在 mh:temp 写入 latestPos:{"out":{pos:[x,y,z], dimension:"xxx"}}

# 更新数值
$execute at $(out) summon marker run function mh:player/pos/__marker_block_pos
$data modify storage mh:temp latestPos."$(out)".pos set from storage mh:temp in.target.pos
data remove storage mh:temp in
$execute unless data storage mh:temp latestPos."$(out)".dimension run \
    data modify storage mh:temp latestPos."$(out)".dimension set from entity $(out) Dimension
