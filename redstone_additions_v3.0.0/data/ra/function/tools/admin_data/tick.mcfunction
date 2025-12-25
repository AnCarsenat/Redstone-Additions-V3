# /ra:tools/admin_data/tick
# Tick admin data tool - right click detection via advancement (minecraft:using_item trigger)

# Right-click detection is handled by advancement ra:tools/admin_data_used
# which calls ra:tools/admin_data/on_use_advancement

# Handle edit mode input
execute as @a[tag=ra.editing_data] run function ra:tools/admin_data/check_input
