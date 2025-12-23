# /ra:tools/data_handler/list_all
# List all data on nearest custom block.
# Run as player, at position near block

tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Block properties & data:","color":"gray"}]
tellraw @s [{"text":"  Properties: ","color":"yellow"},{"nbt":"data.properties","entity":"@e[tag=ra.custom_block,distance=..3,limit=1,sort=nearest]","color":"white"}]
tellraw @s [{"text":"  Data: ","color":"aqua"},{"nbt":"data.data","entity":"@e[tag=ra.custom_block,distance=..3,limit=1,sort=nearest]","color":"white"}]
