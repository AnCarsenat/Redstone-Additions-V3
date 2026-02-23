# /ra_multiblock:blast_forge/validate
# Validate blast forge structure for assembly — tries all 4 directions
# Context: at multiblock base (controller) position
# Sets #mb_result ra.multiblock to 1 if valid in any direction
# Structure: 3x3x3 nether bricks shell with:
#   - Blast furnace (1 block in front of base)
#   - 2 input barrels (flanking the furnace)
#   - 1 output barrel (2 blocks in front of base)
#   - Nether bricks everywhere else

# Try each direction via macro with pre-computed position data
execute store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_facing with storage ra:multiblock bf_dir.north
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_facing with storage ra:multiblock bf_dir.south
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_facing with storage ra:multiblock bf_dir.east
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_facing with storage ra:multiblock bf_dir.west

