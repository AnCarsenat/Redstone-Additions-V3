# /ra_lib:removal/check
# Check if block was broken. As armor stand, at position.
# Output: tag ra.broken added if air, returns 1 if broken, 0 if intact

execute if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute if block ~ ~ ~ #minecraft:air run return 1
return 0
