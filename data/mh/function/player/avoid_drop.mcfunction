execute as @n[type=item,distance=0..6] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] \
    run return run function mh:compass/util/immediate_pickup_stuff

# 如果上面的指令没有执行，Return 0 
return fail