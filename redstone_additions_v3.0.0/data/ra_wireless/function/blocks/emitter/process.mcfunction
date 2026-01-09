# /ra_wireless:blocks/emitter/process
# Process Emitter logic. As armor stand, at position.
# Transmits redstone signal to all receivers on the same channel

# Get channel (default 1)
execute unless data entity @s data.properties.channel run data modify entity @s data.properties.channel set value 1
execute store result score @s ra.channel run data get entity @s data.properties.channel

# Store enabled state (can toggle with wrench)
execute unless data entity @s data.properties.enabled run data modify entity @s data.properties.enabled set value 1b

# Only transmit if enabled
execute unless data entity @s data.properties{enabled:1b} run return 0

# If powered, tag as transmitting
execute if score @s ra.act_red matches 1.. run tag @s add ra.transmitting
execute if score @s ra.act_red matches 0 run tag @s remove ra.transmitting
