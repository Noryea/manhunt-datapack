# @args: {guuid, dimension}
$data modify storage mh:temp out.lodestoneTarget set from storage mh:pdb "$(guuid)".trail[{dimension:"$(dimension)"}]