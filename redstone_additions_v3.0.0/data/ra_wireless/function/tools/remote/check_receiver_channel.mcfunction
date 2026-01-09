# /ra_wireless:tools/remote/check_receiver_channel
# Check if this receiver matches the remote's channel and pulse it
# Context: as receiver

# Get receiver's channel into a fake player score
execute store result score #receiver_channel ra.temp run data get entity @s data.properties.channel

# Compare with the remote's channel (stored in #remote_channel by toggle_receivers)
# If channel matches and receiver is enabled, pulse it
execute if score #receiver_channel ra.temp = #remote_channel ra.temp if data entity @s data.properties{enabled:1b} run tag @s add ra.pulsing
execute if score #receiver_channel ra.temp = #remote_channel ra.temp if data entity @s data.properties{enabled:1b} run scoreboard players set @s ra.pulse_timer 4
