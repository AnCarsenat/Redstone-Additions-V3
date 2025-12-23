# /ra_interactive:blocks/infinite_snow_cauldron/handle_placement
# Handle infinite snow cauldron placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.infinite_snow_cauldron] run return 0

# Place powder snow cauldron (full) with armor stand marker
setblock ~ ~ ~ powder_snow_cauldron[level=3]
summon armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Marker:1b,Tags:["ra.custom_block","ra.custom_block.infinite_snow_cauldron"]}
playsound minecraft:block.stone.place block @a[distance=..16] ~ ~ ~ 1 1

return 1
