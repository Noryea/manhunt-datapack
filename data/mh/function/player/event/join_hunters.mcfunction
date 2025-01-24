team leave @s
team join hunters @s
execute unless function mh:player/hunters_can_have_compass run clear @s *[minecraft:custom_data~{"mh:tracker":{}}]

scoreboard players set @s mh.join.hunters 0