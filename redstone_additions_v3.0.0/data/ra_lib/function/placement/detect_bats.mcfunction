# /data/ra_lib/function/placement/detect_bats.mcfunction`
# Detect spawned bats with custom block tags

execute as @e[type=bat,tag=ra.spawned,tag=!ra.processed] at @s run function ra_lib:placement/process_bat