# /ra:tools/goggles/status/read_status
# Read block properties and display status info via billboard
# Context: as custom block armor stand, at block position

# Read properties from the block's marker entity
data modify storage ra:temp goggles_props set from entity @s data.properties

# Gate blocks — show gate type
execute if entity @s[tag=ra.custom_block.uni_gate] if data entity @s data.properties.gate_type run function ra:tools/goggles/status/read_status_macro

# Wireless blocks — show channel
execute if entity @s[tag=ra.custom_block.emitter] if data entity @s data.properties.channel run function ra:tools/goggles/status/read_status_macro
execute if entity @s[tag=ra.custom_block.receiver] if data entity @s data.properties.channel run function ra:tools/goggles/status/read_status_macro

# Sensor blocks — show detection info
execute if entity @s[tag=ra.custom_block.entity_detector] run function ra:tools/goggles/status/read_status_macro

# Clock — show cooldown
execute if entity @s[tag=ra.custom_block.clock] run function ra:tools/goggles/status/read_status_macro

# Delayer — show delay
execute if entity @s[tag=ra.custom_block.delayer] if data entity @s data.properties.delay run function ra:tools/goggles/status/read_status_macro
