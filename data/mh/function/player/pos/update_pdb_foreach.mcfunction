# early return
execute unless data storage mh:temp in.guuid run return fail
# 判断递归终止条件: len == 0
execute unless data storage mh:temp trailDimensions[] run return fail

data modify storage mh:temp in.dimension set from storage mh:temp trailDimensions[0]
data remove storage mh:temp trailDimensions[0]
function mh:player/pos/get with storage mh:temp in

# 递归调用
function mh:player/pos/update_pdb_foreach