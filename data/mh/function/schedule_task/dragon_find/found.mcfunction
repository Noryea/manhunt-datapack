# 以末影龙为执行者，生成 UUID
function mh:gu/generate
# gu:main out 为 hex 格式 UUID
data modify storage mh:temp dragon_data.uuid_str set from storage gu:main out
# 标记 UUID 有效、末影龙未死亡
scoreboard players set 末影龙UUID有效 mh.temp 1
scoreboard players set 末影龙已死亡 mh.temp 0
# lever 切给检查末影龙血量的周期任务
scoreboard players set dragon_timer_state mh.temp 1
