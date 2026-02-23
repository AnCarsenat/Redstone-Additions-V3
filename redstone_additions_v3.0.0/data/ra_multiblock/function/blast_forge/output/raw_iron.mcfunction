# /ra_multiblock:blast_forge/output/raw_iron
# Raw iron -> 2 iron ingots (ore doubling)
data remove block ~ ~ ~ Items[0]
summon item ~ ~0.7 ~ {Item:{id:"minecraft:iron_ingot",count:2},PickupDelay:10}
