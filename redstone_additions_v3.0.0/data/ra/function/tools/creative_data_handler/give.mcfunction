# /ra:tools/creative_data_handler/give
# Give Creative Data Handler tool to player
# Uses carrot_on_a_stick for reliable click detection

give @s minecraft:carrot_on_a_stick[item_name="Creative Data Handler",lore=['"Shift + Right-click on custom blocks"','"to view and edit properties"'],custom_data={ra:{creative_data_handler:1b}},enchantment_glint_override=true]
tellraw @s [{"text":"[RA] ","color":"gold"},{"text":"Received ","color":"gray"},{"text":"Creative Data Handler","color":"light_purple"}]
