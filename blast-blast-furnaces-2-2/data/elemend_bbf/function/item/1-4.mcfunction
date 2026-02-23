execute if score @s elemend_bbf_item matches 1 run return run execute unless data entity @s data.Items[{id:"minecraft:raw_gold"}]
execute if score @s elemend_bbf_item matches 2 run return run execute unless data entity @s data.Items[{id:"minecraft:nether_gold_ore"}]
execute if score @s elemend_bbf_item matches 3 run return run execute unless data entity @s data.Items[{id:"minecraft:golden_pickaxe"}]
execute unless data entity @s data.Items[{id:"minecraft:golden_axe"}]