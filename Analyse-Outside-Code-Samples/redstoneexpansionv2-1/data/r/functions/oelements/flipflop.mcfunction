
execute at @e[tag=createFLIPFLOP] run setblock ~ ~ ~ quartz_slab
tag @e[tag=createFLIPFLOP] add flip_off
scoreboard players set @e[tag=createFLIPFLOP] flip_amount 1
execute as @e[tag=createFLIPFLOP] run scoreboard players operation @s flip_current = @s flip_amount
tag @e[tag=createFLIPFLOP] remove createFLIPFLOP
execute as @e[tag=FLIPFLOP] at @s if block ~ ~ ~ air run function r:other/eldestroy


tag @e[tag=flip_flanke] remove flip_flanke
tag @e[tag=FLIPFLOP,scores={act_red=0},tag=flip_powered] remove flip_powered
tag @e[tag=FLIPFLOP,scores={act_red=1..},tag=!flip_powered] add flip_flanke
tag @e[tag=FLIPFLOP,scores={act_red=1..},tag=!flip_powered] add flip_powered

scoreboard players remove @e[tag=flip_flanke] flip_current 1

execute as @e[scores={flip_current=..0}] at @s if block ~ ~ ~ quartz_slab run tag @s add flip_on
execute as @e[scores={flip_current=..0}] at @s if block ~ ~ ~ quartz_block run tag @s add flip_off
execute at @e[tag=flip_on] run setblock ~ ~ ~ quartz_block
execute at @e[tag=flip_off] run setblock ~ ~ ~ quartz_slab
tag @e[tag=FLIPFLOP,tag=flip_off] remove out_success
tag @e[tag=FLIPFLOP,tag=flip_on] add out_success
tag @e[tag=flip_on] remove flip_on
tag @e[tag=flip_off] remove flip_off
execute as @e[scores={flip_current=..0}] run scoreboard players operation @s flip_current = @s flip_amount

execute unless entity @e[tag=sound_off] at @e[tag=flip_flanke] run playsound minecraft:block.grass.break master @a ~ ~ ~ 0.7