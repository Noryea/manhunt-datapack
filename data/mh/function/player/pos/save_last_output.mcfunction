# @args: {out: the GUUID of player}
# @output: 复制 "mh:temp"的out 到 "mh:pdb"的lastOutPut."UUID"
$data modify storage mh:pdb lastOutPut."$(out)" set from storage mh:temp out