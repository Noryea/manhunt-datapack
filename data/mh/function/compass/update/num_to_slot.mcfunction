# args: {num: container.x的编号}
# > 将 mh:temp 的 in.slot 转为 "container.(num)"
$data modify storage mh:temp in.slot set value "container.$(num)"