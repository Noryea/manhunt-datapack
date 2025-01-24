# @args: {guuid: 玩家GUUID}
# @output: 复制 "mh:pdb"的lastOutPut."guuid" 到 "mh:temp"的out 
$data modify storage mh:temp out set from storage mh:pdb lastOutPut."$(guuid)"