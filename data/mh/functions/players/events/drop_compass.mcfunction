execute unless predicate mh:sneaking run scoreboard players add @s mh.tracking 1
# 潜行时显示所有列表
execute if predicate mh:sneaking run function mh:compass/all_triggers

scoreboard players set @s mh.drop.compass 0