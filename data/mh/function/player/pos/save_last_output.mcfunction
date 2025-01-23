# @args: {UUID: 玩家UUID}
# @output: 复制 "mh:temp"的out 到 "mh:pdb"的lastOutPut."UUID"
$data modify storage mh:pdb lastOutPut."$(UUID)" set from storage mh:temp out