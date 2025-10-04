# @args: {guuid, dimension}  和 out.lodestoneTarget在mh:temp
$data modify storage mh:pdb "$(guuid)".cachedOutput."$(dimension)" set from storage mh:temp out.lodestoneTarget