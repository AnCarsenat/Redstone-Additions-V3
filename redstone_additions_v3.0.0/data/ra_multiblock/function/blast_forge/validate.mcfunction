# /ra_multiblock:blast_forge/validate
# Validate blast forge structure for assembly
# Context: at multiblock base (controller) position
# Sets #mb_result ra.multiblock to 1 if valid
# Structure: 3x3x3 nether bricks with hopper->furnace->base in center row

# Check structure in all 4 horizontal directions (auto-detect orientation)
execute store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_north
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_south
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_east
execute if score #mb_result ra.multiblock matches 0 store success score #mb_result ra.multiblock run function ra_multiblock:blast_forge/validate_west
