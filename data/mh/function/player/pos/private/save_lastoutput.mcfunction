# @args: {guuid, dimension}  和 in.target在mh:temp
$data modify storage mh:pdb "$(guuid)".lastOutput."$(dimension)" set from storage mh:temp in.target