# /ra:tools/creative_data_handler/tick
# Detect carrot_on_a_stick right-click via scoreboard

# Check for players who clicked with creative_data_handler in hand
execute as @a[scores={ra.coas_click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[custom_data~{ra:{creative_data_handler:1b}}] at @s run function ra:tools/creative_data_handler/on_use
execute as @a[scores={ra.coas_click=1..}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[custom_data~{ra:{creative_data_handler:1b}}] at @s run function ra:tools/creative_data_handler/on_use
