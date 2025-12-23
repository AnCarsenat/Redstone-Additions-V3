# /ra:tools/data_handler/show_info
# Show block properties and data. As player.

tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"Block Info","color":"gold","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"Properties: ","color":"yellow"},{"nbt":"data.properties","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"white"}]
tellraw @s [{"text":"Data: ","color":"aqua"},{"nbt":"data.data","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"white"}]
tellraw @s [{"text":"Shift + Right-click","color":"gray","italic":true},{"text":" to edit values","color":"dark_gray","italic":true}]
