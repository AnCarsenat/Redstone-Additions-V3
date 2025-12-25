# /ra:tools/admin_data/give
# Give Admin Data Tool to player (admin only)
# Right-click: View block data (runtime)
# Shift + Right-click: Enter data edit mode

# Uses food component with can_always_eat for right-click detection
give @s stick[item_model="minecraft:command_block",item_name='Admin Data Tool',custom_data={ra:{admin_data:1b}},enchantment_glint_override=true,rarity=epic,food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:1000000,animation:"none",has_consume_particles:false}]
