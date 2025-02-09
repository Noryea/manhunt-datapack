# @args: {guuid, dimension}
$data modify storage mh:temp in.target set from storage mh:pdb "$(guuid)".trail[{dimension:"$(dimension)"}]