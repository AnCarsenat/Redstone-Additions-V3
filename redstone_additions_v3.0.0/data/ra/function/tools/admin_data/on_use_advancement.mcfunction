# /ra:tools/admin_data/on_use_advancement
# Called by advancement when player uses admin data tool. As player.

# Revoke the advancement so it can trigger again
advancement revoke @s only ra:tools/admin_data_used

# Run the actual on_use function at player position
execute at @s run function ra:tools/admin_data/on_use
