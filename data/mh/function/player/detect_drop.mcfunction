execute anchored eyes positioned ^ ^ ^ as @n[type=item,distance=0..6] if items entity @s contents *[minecraft:custom_data~{"mh:tracker":{}}] run \
    return run function mh:compass/util/immediately_pickup

# 如果上面的指令没有执行，Return 0 
return fail