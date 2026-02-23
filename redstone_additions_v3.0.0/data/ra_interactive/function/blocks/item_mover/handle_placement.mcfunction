# /ra_interactive:blocks/item_mover/handle_placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.item_mover] run return 0

# Place observer with full 6-directional facing (dir_type:2)
function ra_lib:placement/place {block_id:"minecraft:observer",block_tag:"item_mover",dir_type:2}

# Flip observer facing so the "face" texture points toward input (back)
# #facing ra.temp: 0=down,1=up,2=north,3=south,4=west,5=east
execute if score #facing ra.temp matches 0 run setblock ~ ~ ~ observer[facing=up] replace
execute if score #facing ra.temp matches 1 run setblock ~ ~ ~ observer[facing=down] replace
execute if score #facing ra.temp matches 2 run setblock ~ ~ ~ observer[facing=south] replace
execute if score #facing ra.temp matches 3 run setblock ~ ~ ~ observer[facing=north] replace
execute if score #facing ra.temp matches 4 run setblock ~ ~ ~ observer[facing=east] replace
execute if score #facing ra.temp matches 5 run setblock ~ ~ ~ observer[facing=west] replace

# Remove ra.new tag
tag @e[tag=ra.custom_block.item_mover,tag=ra.new] remove ra.new

return 1
