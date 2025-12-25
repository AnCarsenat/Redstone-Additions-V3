# /ra:tools/admin_data/show_info
# Show block runtime data. As player.

tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"Admin Data","color":"dark_purple","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"Runtime Data: ","color":"light_purple"},{"nbt":"data.data","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"white"}]
tellraw @s [{"text":"Properties: ","color":"yellow"},{"nbt":"data.properties","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"gray"}]
tellraw @s [{"text":"Shift + Right-click","color":"gray","italic":true},{"text":" to edit runtime data","color":"dark_gray","italic":true}]
