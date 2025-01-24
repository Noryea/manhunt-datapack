# @args: {out: the GUUID of player}
# @output: 复制 "mh:temp"的out 到 "mh:pdb"的lastOutPut."UUID"
# >用于定期更新模式
# 比如1分钟更新一次，则每1分钟每位玩家执行本函数，更新lastOutPut，而指南针则直接读lastOutPut里的数据

# 调用一次pos/get函数（获取最新坐标）
$function mh:player/pos/get {guuid: $(guuid), dimension: "$(dimension)"}
# 保存到lastOutPut
$data modify storage mh:pdb lastOutPut."$(out)" set from storage mh:temp out
# 顺便不留out标签
data remove storage mh:temp out