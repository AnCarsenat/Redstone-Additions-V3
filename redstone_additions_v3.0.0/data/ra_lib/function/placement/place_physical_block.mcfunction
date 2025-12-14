# /data/ra_lib/function/placement/place_physical_block.mcfunction
# Place the physical Minecraft block
# Context: at block position
# Macro params: block_id (minecraft block), dir_type (0/1/2)

$execute if score #facing ra.temp matches 0 run setblock ~ ~ ~ $(block_id)[facing=down] replace
$execute if score #facing ra.temp matches 1 run setblock ~ ~ ~ $(block_id)[facing=up] replace
$execute if score #facing ra.temp matches 2 run setblock ~ ~ ~ $(block_id)[facing=north] replace
$execute if score #facing ra.temp matches 3 run setblock ~ ~ ~ $(block_id)[facing=south] replace
$execute if score #facing ra.temp matches 4 run setblock ~ ~ ~ $(block_id)[facing=west] replace
$execute if score #facing ra.temp matches 5 run setblock ~ ~ ~ $(block_id)[facing=east] replace