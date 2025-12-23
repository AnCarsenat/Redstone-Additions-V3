# /ra:tools/data_handler/tick
# Tick data handler - detect carrot_on_a_stick right click

# Create scoreboard if not exists
scoreboard objectives add ra.use_coas used:carrot_on_a_stick

# Detect right click with data handler
execute as @a[scores={ra.use_coas=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{ra:{data_handler:1b}}}}}] at @s run function ra:tools/data_handler/on_use
scoreboard players set @a[scores={ra.use_coas=1..}] ra.use_coas 0

# Handle edit mode input
execute as @a[tag=ra.editing_block] run function ra:tools/data_handler/check_input
