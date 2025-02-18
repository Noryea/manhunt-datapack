# @executor: 指南针持有者
# @args: in.guuid 在 mh:temp
# @output: 在 mh:temp 的 trackingText 储存指南针的目标tooltip

# data remove storage mh:temp trackingText
data modify storage mh:temp trackingText set value {text:"正在追踪: ",color:"white", extra:[{selector:""}]}
data modify storage mh:temp trackingText.extra[0].selector set from storage mh:temp in.guuid
execute unless data storage mh:temp in.guuid run data modify storage mh:temp trackingText.extra set value [{text:"未知",color:"gray"}]