# /ra_lib:removal/drop {item:"..."}
# Drop item entity. At position. Does NOT kill armor stand.
# Input: item = full Item compound as string

$summon item ~ ~ ~ {Item:$(item)}
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5
