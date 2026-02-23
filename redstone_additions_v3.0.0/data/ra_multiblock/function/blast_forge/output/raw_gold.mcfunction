# /ra_multiblock:blast_forge/output/raw_gold
# Raw gold -> 2 gold ingots (ore doubling)
data remove block ~ ~ ~ Items[0]
summon item ~ ~0.7 ~ {Item:{id:"minecraft:gold_ingot",count:2},PickupDelay:10}
