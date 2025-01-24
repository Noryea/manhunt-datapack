# @args: {guuid, dimension}
# @output {out: {pos: [x,y,z], dimension: string}} 在mh:temp

# 如果更新模式是定期更新, 则直接返回lastOutPut下的"(guuid)"的值
$execute if score 追踪器:更新模式 mh.settings matches 3 run \
    return run data modify storage mh:temp out set from storage mh:pdb lastOutPut."$(guuid)"
# 否则调用pos/get函数
$function mh:player/pos/get {guuid: $(guuid), dimension: "$(dimension)"}