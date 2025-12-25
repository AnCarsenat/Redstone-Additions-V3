# /ra:tools/admin_data/handle_interaction
# Handle interaction with a custom block. As armor stand.

# Store block UUID for later
data modify storage ra:temp target_block set from entity @s UUID

# Check if player is sneaking (shift) using predicate - enter edit mode
execute as @a[distance=..10,nbt={using_item:{components:{"minecraft:custom_data":{ra:{admin_data:1b}}}}}] if predicate ra:is_sneaking run function ra:tools/admin_data/start_edit
execute as @a[distance=..10,nbt={using_item:{components:{"minecraft:custom_data":{ra:{admin_data:1b}}}}}] unless predicate ra:is_sneaking run function ra:tools/admin_data/show_info
