team leave @s
team join runners @s
execute unless function mh:player/runners_can_have_compass run clear @s *[minecraft:custom_data~{"mh:tracker":{}}]

scoreboard players set @s mh.join.runners 0