# /data/ra_lib/function/placement/process_bat.mcfunction
# Process a bat placement
# Context: as bat, at bat

tag @s add ra.processed

# Find nearest player (who spawned the bat)
tag @p add ra.placer

# Store bat position (block-aligned)
execute align xyz store result score #x ra.temp run data get entity @s Pos[0]
execute align xyz store result score #y ra.temp run data get entity @s Pos[1]
execute align xyz store result score #z ra.temp run data get entity @s Pos[2]

# Get block definition from bat's custom data and route to registry
function ra_lib:placement/route_placement

# Clean up
tag @a[tag=ra.placer] remove ra.placer
kill @s