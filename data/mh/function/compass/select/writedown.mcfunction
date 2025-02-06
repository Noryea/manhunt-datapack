# @executor 玩家
# @args {raw: 页面文本}
# > 尝试以raw的值为名字选择目标，执行gu（没找到目标则gu:main的out为空)

# 如果没有这名玩家, 则直接报错
$execute unless entity @a[name=$(raw)] run \
    return run tellraw @s "\u00a7c找不到名为“$(raw)”的玩家"

# 给可追踪目标加上mh.trackable标签
function mh:compass/util/filter_my_trackable
# 直接以新目标执行gu
$execute as @a[limit=1,tag=mh.trackable,name=$(raw)] run function mh:gu/generate
# 聊天栏提示
$tellraw @s {"text": "已选择追踪目标：","color": "white","extra": [{"selector": "@a[limit=1,tag=mh.trackable,name=$(raw)]"}]}
# 移除所有玩家的标签
tag @a remove mh.trackable

$execute unless data storage gu:main out run \
    return run tellraw @s "\u00a7c$(raw)不是你所在队伍可以追踪的目标"