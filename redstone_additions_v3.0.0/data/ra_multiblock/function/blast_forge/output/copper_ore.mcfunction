# /ra_multiblock:blast_forge/output/copper_ore
# Copper ore -> 2 copper ingots (ore doubling)
data remove block ~ ~ ~ Items[0]
summon item ~ ~0.7 ~ {Item:{id:"minecraft:copper_ingot",count:2},PickupDelay:10}
