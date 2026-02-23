# /ra_lib_multiblock:setup_marker
# Setup multiblock marker with type-specific data
# Context: as new marker entity

# Get type from storage and add specific tag
data modify entity @s data.type set from storage ra:multiblock type
execute store result entity @s data.rotation float 1 run data get storage ra:multiblock rotation

# Add type-specific tag and facing direction
execute if data storage ra:multiblock {type:"blast_forge"} run tag @s add ra.multiblock.blast_forge
execute if data storage ra:multiblock facing run data modify entity @s data.facing set from storage ra:multiblock facing

# Initialize common properties
data modify entity @s data.properties set value {enabled:1b}

# Remove new tag
tag @s remove ra.multiblock.new
