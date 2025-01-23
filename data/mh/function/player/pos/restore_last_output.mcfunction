# @args: {UUID: 玩家UUID}
# @output: 复制 "mh:pdb"的lastOutPut."UUID" 到 "mh:temp"的out 
$data modify storage mh:temp out set from storage mh:pdb lastOutPut."$(UUID)"