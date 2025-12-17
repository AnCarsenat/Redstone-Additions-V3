# /data/ra_lib/function/inventory/initialize.mcfunction
# Initialize inventory management system

# Scoreboard for slot operations
scoreboard objectives add ra.inv.slot dummy
scoreboard objectives add ra.inv.count dummy
scoreboard objectives add ra.inv.max_slot dummy

tellraw @a [{"text":"[RA Lib] ","color":"gold"},{"text":"Inventory system initialized","color":"gray"}]
