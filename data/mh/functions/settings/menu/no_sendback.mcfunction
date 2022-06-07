# 运行函数时顺带运行这个函数，则不返回运行成功信息
execute store result score #sendback mh.temp run gamerule sendCommandFeedback
gamerule sendCommandFeedback false
execute if score #sendback mh.temp matches 1 run schedule function mh:settings/menu/re_sendback 2t replace