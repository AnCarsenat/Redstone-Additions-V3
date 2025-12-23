# /ra_interactive:blocks/message/send_message
# Send the message to nearby players. As armor stand, at position.

# Copy message to storage
data modify storage ra:temp message set from entity @s data.properties.message

# Send tellraw with the message based on range
execute if score #range ra.temp matches ..8 run tellraw @a[distance=..8] [{"text":"[Message] ","color":"yellow"},{"nbt":"message","storage":"ra:temp","color":"white"}]
execute if score #range ra.temp matches 9..16 run tellraw @a[distance=..16] [{"text":"[Message] ","color":"yellow"},{"nbt":"message","storage":"ra:temp","color":"white"}]
execute if score #range ra.temp matches 17..32 run tellraw @a[distance=..32] [{"text":"[Message] ","color":"yellow"},{"nbt":"message","storage":"ra:temp","color":"white"}]
execute if score #range ra.temp matches 33.. run tellraw @a[distance=..64] [{"text":"[Message] ","color":"yellow"},{"nbt":"message","storage":"ra:temp","color":"white"}]

playsound minecraft:block.note_block.chime block @a[distance=..16] ~ ~ ~ 0.5 1.2
