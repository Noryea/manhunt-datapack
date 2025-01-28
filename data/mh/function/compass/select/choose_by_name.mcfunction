# @executor 玩家
# @args {raw: 页面文本}
# > 尝试以raw的值为名字选择目标


# remove "out" nbt
data remove storage gu:main out

# 如果输入参数含非法字符, 直接终止
$execute store result score #flag mh.temp run \
    function mh:compass/select/varify_name_str {raw: "$(raw)"}
execute if score #flag mh.temp matches 0 run \
    return fail
    
# 给可追踪目标加上mh.trackable标签
function mh:compass/util/filter_my_trackable

# 直接以新目标执行gu
$execute as @a[limit=1,tag=mh.trackable,name=$(raw)] run function mh:gu/generate

# 移除所有玩家的标签
tag @a remove mh.trackable