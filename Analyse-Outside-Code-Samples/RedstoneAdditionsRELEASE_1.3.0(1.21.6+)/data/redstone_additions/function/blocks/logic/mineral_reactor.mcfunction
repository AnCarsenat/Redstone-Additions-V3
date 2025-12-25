# execute unless block ^ ^ ^1 #air run return fail

execute store result score @s redstone_additions.temp run random value 1..100
execute if score @s redstone_additions.temp matches 1 run return run setblock ^ ^ ^1 diamond_ore
execute if score @s redstone_additions.temp matches 2..5 run return run setblock ^ ^ ^1 lapis_ore
execute if score @s redstone_additions.temp matches 6..10 run return run setblock ^ ^ ^1 gold_ore
execute if score @s redstone_additions.temp matches 11..20 run return run setblock ^ ^ ^1 iron_ore
execute if score @s redstone_additions.temp matches 21..30 run return run setblock ^ ^ ^1 copper_ore
execute if score @s redstone_additions.temp matches 31..40 run return run setblock ^ ^ ^1 coal_ore
execute if score @s redstone_additions.temp matches 41..50 run return run setblock ^ ^ ^1 redstone_ore
execute if score @s redstone_additions.temp matches 51..65 run return run setblock ^ ^ ^1 emerald_ore
execute if score @s redstone_additions.temp matches 66..100 run return run setblock ^ ^ ^1 stone