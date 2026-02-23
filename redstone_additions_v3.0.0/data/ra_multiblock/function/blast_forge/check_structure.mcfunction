# /ra_multiblock:blast_forge/check_structure
# Check if blast forge structure is still valid
# Context: as multiblock marker, at its position

# Get facing from marker data
data modify storage ra:temp mb_facing set from entity @s data.facing

# Check based on facing direction
execute if data entity @s data{facing:"north"} run function ra_multiblock:blast_forge/check_north
execute if data entity @s data{facing:"south"} run function ra_multiblock:blast_forge/check_south
execute if data entity @s data{facing:"east"} run function ra_multiblock:blast_forge/check_east
execute if data entity @s data{facing:"west"} run function ra_multiblock:blast_forge/check_west
