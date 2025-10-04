# @args: {selector: uuid}
function mh:compass/util/filter_my_trackable
$execute as $(selector) run return run execute if entity @s[tag=mh.trackable]
tag @a remove mh.trackable