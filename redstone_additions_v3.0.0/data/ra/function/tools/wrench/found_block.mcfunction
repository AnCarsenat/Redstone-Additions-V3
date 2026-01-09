# /ra:tools/wrench/found_block
# Handle found block for wrench
# Context: as custom block armor stand

data modify storage ra:temp wrench_found set value 1b

# Toggle wireless emitters
execute if entity @s[tag=ra.custom_block.emitter] run function ra_wireless:blocks/emitter/toggle

# Toggle wireless receivers
execute if entity @s[tag=ra.custom_block.receiver] run function ra_wireless:blocks/receiver/toggle

# No action for other blocks
execute unless entity @s[tag=ra.custom_block.emitter] unless entity @s[tag=ra.custom_block.receiver] run tellraw @a[tag=ra.wrench_active,distance=..8] [{"text":"[Wrench] ","color":"gold"},{"text":"This block cannot be toggled.","color":"gray"}]
