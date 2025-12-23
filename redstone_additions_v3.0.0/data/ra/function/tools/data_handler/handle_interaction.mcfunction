# /ra:tools/data_handler/handle_interaction
# Handle interaction with a custom block. As armor stand.

# Store block UUID for later
data modify storage ra:temp target_block set from entity @s UUID

# Check if player is sneaking (shift) - enter edit mode
execute as @a[distance=..10,nbt={SelectedItem:{components:{"minecraft:custom_data":{ra:{data_handler:1b}}}},Sneaking:1b}] run function ra:tools/data_handler/start_edit
execute as @a[distance=..10,nbt={SelectedItem:{components:{"minecraft:custom_data":{ra:{data_handler:1b}}}},Sneaking:0b}] run function ra:tools/data_handler/show_info
