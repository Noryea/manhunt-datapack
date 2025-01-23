# @args: {selector: the GUUID of tracked player }


data modify storage mh:temp Inv set from entity @s Inventory[{components:{"minecraft:custom_data":{"mh:tracker":{}}}}]
function mh:schedule_task/update/inv_foreach
