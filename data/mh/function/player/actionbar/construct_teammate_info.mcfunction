# @args: trackerData和targetCopy 在 mh:temp
# @output: actionBarExtra 在 mh:temp

data modify storage mh:temp actionBarExtra set value []

execute if score 队友追踪器:显示维度 mh.settings matches 1 run data modify storage mh:temp actionBarExtra prepend value {text:"",extra:[{text:"维度:",color:"white"},{text:""}]}
execute if score 队友追踪器:显示维度 mh.settings matches 1 if data storage mh:temp {trackerData:{info:{exactDimension:"minecraft:overworld"}}} run data modify storage mh:temp actionBarExtra[0].extra[1] set value {translate: "flat_world_preset.minecraft.overworld"}
execute if score 队友追踪器:显示维度 mh.settings matches 1 if data storage mh:temp {trackerData:{info:{exactDimension:"minecraft:the_nether"}}} run data modify storage mh:temp actionBarExtra[0].extra[1] set value {translate: "advancements.nether.root.title"}
execute if score 队友追踪器:显示维度 mh.settings matches 1 if data storage mh:temp {trackerData:{info:{exactDimension:"minecraft:the_end"}}} run data modify storage mh:temp actionBarExtra[0].extra[1] set value {translate: "advancements.end.root.title"}
execute if score 队友追踪器:显示维度 mh.settings matches 1 unless data storage mh:temp actionBarExtra[0].extra[1].translate run \
    data modify storage mh:temp actionBarExtra[0].extra[1].text set from storage mh:temp trackerData.info.exactDimension

# 如果跨维度,直接终止
scoreboard players set #result mh.temp 1
execute at @s store result score #result mh.temp run function mh:player/pos/private/check_dimension with storage mh:temp targetCopy
execute unless score #result mh.temp matches 1 run \
    return fail

execute if score 队友追踪器:显示XZ坐标 mh.settings matches 1 if score 队友追踪器:显示Y坐标 mh.settings matches 1 run \
    data modify storage mh:temp actionBarExtra prepend value {text:"",extra:[{text:"XYZ=",color:"white"},{nbt:"targetCopy.pos[0]",storage:"mh:temp"},{text:",",color:"gray"},{nbt:"targetCopy.pos[1]",storage:"mh:temp"},{text:",",color:"gray"},{nbt:"targetCopy.pos[2]",storage:"mh:temp"}]}
execute unless score 队友追踪器:显示XZ坐标 mh.settings matches 1 if score 队友追踪器:显示Y坐标 mh.settings matches 1 run \
    data modify storage mh:temp actionBarExtra prepend value {text:"",extra:[{text:"Y=",color:"white"},{nbt:"targetCopy.pos[1]",storage:"mh:temp"}]}
execute if score 队友追踪器:显示XZ坐标 mh.settings matches 1 unless score 队友追踪器:显示Y坐标 mh.settings matches 1 run \
    data modify storage mh:temp actionBarExtra prepend value {text:"",extra:[{text:"XZ=",color:"white"},{nbt:"targetCopy.pos[0]",storage:"mh:temp"},{text:",",color:"gray"},{nbt:"targetCopy.pos[2]",storage:"mh:temp"}]}


execute unless score 队友追踪器:显示距离 mh.settings matches 1 run \
    return fail
execute store result score deltaX mh.temp run data get storage mh:temp targetCopy.pos[0] 10
execute store result score deltaY mh.temp run data get storage mh:temp targetCopy.pos[1] 10
execute store result score deltaZ mh.temp run data get storage mh:temp targetCopy.pos[2] 10
execute store result score X mh.temp run data get entity @s Pos[0] 10
execute store result score Y mh.temp run data get entity @s Pos[1] 10
execute store result score Z mh.temp run data get entity @s Pos[2] 10
scoreboard players operation deltaX mh.temp -= X mh.temp
scoreboard players operation deltaY mh.temp -= Y mh.temp
scoreboard players operation deltaZ mh.temp -= Z mh.temp
execute store result storage mh:temp in.x float 0.1 run scoreboard players get deltaX mh.temp
execute store result storage mh:temp in.y float 0.1 run scoreboard players get deltaY mh.temp
execute store result storage mh:temp in.z float 0.1 run scoreboard players get deltaZ mh.temp
execute summon item_display run function mh:player/actionbar/distancefor with storage mh:temp in
data modify storage mh:temp actionBarExtra prepend value {score: {name: "距离_个位", objective: "mh.temp"}, extra: ["m"]}