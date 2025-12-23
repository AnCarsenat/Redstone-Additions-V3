# /ra:tools/data_handler/display_block_data
# Display the data of a custom block. As armor stand.

# Store the block's data to show
data modify storage ra:temp block_data set from entity @s data

# Display to players with data handler
execute as @a[distance=..10,nbt={SelectedItem:{components:{"minecraft:custom_data":{ra:{data_handler:1b}}}}}] run tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Properties: ","color":"yellow"},{"nbt":"data.properties","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"white"}]
