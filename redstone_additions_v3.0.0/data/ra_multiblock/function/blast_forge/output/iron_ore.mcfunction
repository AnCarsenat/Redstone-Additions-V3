# /ra_multiblock:blast_forge/output/iron_ore
# Iron ore -> 2 iron ingots (ore doubling)
data remove block ~ ~ ~ Items[0]
summon item ~ ~0.7 ~ {Item:{id:"minecraft:iron_ingot",count:2},PickupDelay:10}
