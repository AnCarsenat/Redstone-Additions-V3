# /ra_interactive:blocks/breeder/on_powered
# Breeder is powered - attempt to breed animals in front. As armor stand, at dispenser position.

# Check if dispenser has any items
execute unless data block ~ ~ ~ Items[0] run return 0

# Store position in front for entity checks (^ ^ ^1 = 1 block in facing direction)
# Look for breedable animals in a 2 block radius in front

# Try to breed each animal type with their corresponding food
# The functions will check for the right food and consume it

execute positioned ^ ^ ^1 run function ra_interactive:blocks/breeder/try_breed
