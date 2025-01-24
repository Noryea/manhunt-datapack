# 如果玩家死亡，直接返回
execute if data entity @s {Health:0.0f} run \
    return run advancement revoke @s only mh:detect/inventory_changed

function mh:player/main

# 让进度可以重新触发
advancement revoke @s only mh:detect/inventory_changed