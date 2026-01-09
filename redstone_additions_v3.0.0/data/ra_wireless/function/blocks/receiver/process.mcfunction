# /ra_wireless:blocks/receiver/process
# Process Receiver logic. As armor stand, at position.
# Receives signal from emitters on the same channel or pulses from remote

# Get channel (default 1)
execute unless data entity @s data.properties.channel run data modify entity @s data.properties.channel set value 1
execute store result score @s ra.channel run data get entity @s data.properties.channel

# Store enabled state (can toggle with wrench)
execute unless data entity @s data.properties.enabled run data modify entity @s data.properties.enabled set value 1b

# Only receive if enabled
execute unless data entity @s data.properties{enabled:1b} at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
execute unless data entity @s data.properties{enabled:1b} run return 0

# Check if pulsing from remote
execute if entity @s[tag=ra.pulsing] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute if entity @s[tag=ra.pulsing] run scoreboard players remove @s ra.pulse_timer 1
execute if entity @s[tag=ra.pulsing] if score @s ra.pulse_timer matches ..0 run tag @s remove ra.pulsing

# If pulsing, skip emitter check
execute if entity @s[tag=ra.pulsing] run return 1

# Check if any emitter on same channel is transmitting
tag @s add ra.checking
scoreboard players operation #check_channel ra.temp = @s ra.channel

# Look for any emitter that is transmitting on our channel
execute as @e[tag=ra.custom_block.emitter,tag=ra.transmitting] if score @s ra.channel = #check_channel ra.temp run tag @e[tag=ra.checking] add ra.receiving

# Output based on receiving state
execute if entity @s[tag=ra.receiving] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.receiving] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block

# Cleanup
tag @s remove ra.checking
tag @s remove ra.receiving
