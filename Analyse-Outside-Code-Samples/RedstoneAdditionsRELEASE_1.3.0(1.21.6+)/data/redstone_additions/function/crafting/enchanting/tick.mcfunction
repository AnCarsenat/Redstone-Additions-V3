execute as @e[type=item,nbt={Item:{id:"minecraft:lava_bucket"}}] at @s if block ~ ~-0.5 ~ enchanting_table run tag @s add redstone_additions.lava_core_craft
execute as @e[type=item,tag=redstone_additions.lava_core_craft] store result score @s redstone_additions.temp run random value 1..10
execute as @e[type=item,tag=redstone_additions.lava_core_craft] if score @s redstone_additions.temp matches 1 at @s run function redstone_additions:crafting/enchanting/lava_core
execute at @e[type=item,tag=redstone_additions.lava_core_craft] run particle enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.1 10
execute at @e[type=item,tag=redstone_additions.lava_core_craft] run playsound minecraft:block.amethyst_block.break ambient @a ~ ~ ~ 1 0.65

kill @e[type=item,tag=redstone_additions.lava_core_craft]


execute as @e[type=item,nbt={Item:{id:"minecraft:smooth_stone"}}] at @s if block ~ ~-0.5 ~ enchanting_table run tag @s add redstone_additions.mineral_core_craft
execute as @e[type=item,tag=redstone_additions.mineral_core_craft] store result score @s redstone_additions.temp run random value 1..10
execute as @e[type=item,tag=redstone_additions.mineral_core_craft] if score @s redstone_additions.temp matches 1 at @s run function redstone_additions:crafting/enchanting/mineral_core
execute at @e[type=item,tag=redstone_additions.mineral_core_craft] run particle enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.1 10
execute at @e[type=item,tag=redstone_additions.mineral_core_craft] run playsound minecraft:block.amethyst_block.break ambient @a ~ ~ ~ 1 0.65

kill @e[type=item,tag=redstone_additions.mineral_core_craft]