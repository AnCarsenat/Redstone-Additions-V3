# /data/ra_lib/function/removal/detect_break.mcfunction
# Detect when custom blocks are broken (physical block missing)
# Need to switch this to the correct block instead of this.
execute as @e[tag=ra.custom_block] at @s if block ~ ~ ~ #air run function ra_lib:removal/drop_item

# OR SIWTCH TO THIS : unless block ~ ~ ~ #ra:custom_blocks