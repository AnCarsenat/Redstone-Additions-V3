# /ra_multiblock:blast_forge/check_structure
# Periodic structure integrity check — dispatches to macro by facing
# Context: as multiblock marker, at base position
# Sets @s ra.multiblock to 1 if structure is still valid

execute if data entity @s data{facing:"north"} run function ra_multiblock:blast_forge/check_facing with storage ra:multiblock bf_dir.north
execute if data entity @s data{facing:"south"} run function ra_multiblock:blast_forge/check_facing with storage ra:multiblock bf_dir.south
execute if data entity @s data{facing:"east"} run function ra_multiblock:blast_forge/check_facing with storage ra:multiblock bf_dir.east
execute if data entity @s data{facing:"west"} run function ra_multiblock:blast_forge/check_facing with storage ra:multiblock bf_dir.west
