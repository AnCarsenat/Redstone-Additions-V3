# /ra_interactive:blocks/block_placer/on_powered
# Block placer is powered - place a block in front. As armor stand, at dispenser position.

# Check if there's air in front
execute positioned ^ ^ ^1 unless block ~ ~ ~ air run return 0

# Check if dispenser has any items
execute unless data block ~ ~ ~ Items[0] run return 0

# Get the block ID and count from first item
data modify storage ra:temp place_item set from block ~ ~ ~ Items[0]

# Place block using macro (needs id and count)
execute positioned ^ ^ ^1 run function ra_interactive:blocks/block_placer/place_block with storage ra:temp place_item

# Play sound
playsound minecraft:block.stone.place block @a[distance=..16] ^ ^ ^1 1 0.8
particle minecraft:cloud ^ ^ ^1 0.2 0.2 0.2 0.02 5
