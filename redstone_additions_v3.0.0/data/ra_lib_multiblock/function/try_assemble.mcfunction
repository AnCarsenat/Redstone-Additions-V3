# /ra_lib_multiblock:try_assemble
# Try to assemble a multiblock at current position
# Context: at block position (player looking at)
# Input storage ra:multiblock: {type:"multiblock_id"}
# Returns: 1 if assembled, 0 if failed

# Reset result
scoreboard players set #mb_result ra.multiblock 0

# Check if already assembled here
execute if entity @e[tag=ra.multiblock,distance=..0.5,limit=1] run return 0

# Dispatch to specific multiblock type's validation
# Each type sets #mb_result to 1 if structure is valid
execute if data storage ra:multiblock {type:"blast_forge"} run function ra_multiblock:blast_forge/validate

# If validation passed, create the multiblock marker
execute if score #mb_result ra.multiblock matches 1 run function ra_lib_multiblock:create_marker

return run scoreboard players get #mb_result ra.multiblock
