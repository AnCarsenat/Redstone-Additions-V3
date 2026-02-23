# /ra_multiblock:blast_forge/process
# Process items in blast forge hopper
# Context: as multiblock marker, at hopper position
# Input: entity @s data.input contains hopper items

# Get first item
data modify storage ra:temp bf_item set from entity @s data.input[0]

# Raw ores -> 2 ingots (ore doubling)
execute if data storage ra:temp bf_item{id:"minecraft:raw_iron"} run function ra_multiblock:blast_forge/output/raw_iron
execute if data storage ra:temp bf_item{id:"minecraft:raw_gold"} run function ra_multiblock:blast_forge/output/raw_gold
execute if data storage ra:temp bf_item{id:"minecraft:raw_copper"} run function ra_multiblock:blast_forge/output/raw_copper

# Ore blocks -> 2 ingots
execute if data storage ra:temp bf_item{id:"minecraft:iron_ore"} run function ra_multiblock:blast_forge/output/iron_ore
execute if data storage ra:temp bf_item{id:"minecraft:gold_ore"} run function ra_multiblock:blast_forge/output/gold_ore
execute if data storage ra:temp bf_item{id:"minecraft:copper_ore"} run function ra_multiblock:blast_forge/output/copper_ore
execute if data storage ra:temp bf_item{id:"minecraft:deepslate_iron_ore"} run function ra_multiblock:blast_forge/output/iron_ore
execute if data storage ra:temp bf_item{id:"minecraft:deepslate_gold_ore"} run function ra_multiblock:blast_forge/output/gold_ore
execute if data storage ra:temp bf_item{id:"minecraft:deepslate_copper_ore"} run function ra_multiblock:blast_forge/output/copper_ore

# Iron equipment -> nuggets
execute if data storage ra:temp bf_item{id:"minecraft:iron_sword"} run function ra_multiblock:blast_forge/output/iron_2
execute if data storage ra:temp bf_item{id:"minecraft:iron_pickaxe"} run function ra_multiblock:blast_forge/output/iron_3
execute if data storage ra:temp bf_item{id:"minecraft:iron_axe"} run function ra_multiblock:blast_forge/output/iron_3
execute if data storage ra:temp bf_item{id:"minecraft:iron_shovel"} run function ra_multiblock:blast_forge/output/iron_1
execute if data storage ra:temp bf_item{id:"minecraft:iron_hoe"} run function ra_multiblock:blast_forge/output/iron_2
execute if data storage ra:temp bf_item{id:"minecraft:iron_helmet"} run function ra_multiblock:blast_forge/output/iron_5
execute if data storage ra:temp bf_item{id:"minecraft:iron_chestplate"} run function ra_multiblock:blast_forge/output/iron_8
execute if data storage ra:temp bf_item{id:"minecraft:iron_leggings"} run function ra_multiblock:blast_forge/output/iron_7
execute if data storage ra:temp bf_item{id:"minecraft:iron_boots"} run function ra_multiblock:blast_forge/output/iron_4
execute if data storage ra:temp bf_item{id:"minecraft:iron_horse_armor"} run function ra_multiblock:blast_forge/output/iron_6

# Gold equipment -> nuggets
execute if data storage ra:temp bf_item{id:"minecraft:golden_sword"} run function ra_multiblock:blast_forge/output/gold_2
execute if data storage ra:temp bf_item{id:"minecraft:golden_pickaxe"} run function ra_multiblock:blast_forge/output/gold_3
execute if data storage ra:temp bf_item{id:"minecraft:golden_axe"} run function ra_multiblock:blast_forge/output/gold_3
execute if data storage ra:temp bf_item{id:"minecraft:golden_shovel"} run function ra_multiblock:blast_forge/output/gold_1
execute if data storage ra:temp bf_item{id:"minecraft:golden_hoe"} run function ra_multiblock:blast_forge/output/gold_2
execute if data storage ra:temp bf_item{id:"minecraft:golden_helmet"} run function ra_multiblock:blast_forge/output/gold_5
execute if data storage ra:temp bf_item{id:"minecraft:golden_chestplate"} run function ra_multiblock:blast_forge/output/gold_8
execute if data storage ra:temp bf_item{id:"minecraft:golden_leggings"} run function ra_multiblock:blast_forge/output/gold_7
execute if data storage ra:temp bf_item{id:"minecraft:golden_boots"} run function ra_multiblock:blast_forge/output/gold_4
execute if data storage ra:temp bf_item{id:"minecraft:golden_horse_armor"} run function ra_multiblock:blast_forge/output/gold_6

# Chainmail -> iron nuggets
execute if data storage ra:temp bf_item{id:"minecraft:chainmail_helmet"} run function ra_multiblock:blast_forge/output/iron_5
execute if data storage ra:temp bf_item{id:"minecraft:chainmail_chestplate"} run function ra_multiblock:blast_forge/output/iron_8
execute if data storage ra:temp bf_item{id:"minecraft:chainmail_leggings"} run function ra_multiblock:blast_forge/output/iron_7
execute if data storage ra:temp bf_item{id:"minecraft:chainmail_boots"} run function ra_multiblock:blast_forge/output/iron_4
