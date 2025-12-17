execute if block ~ ~ ~1 minecraft:redstone_wire[power=0,south=side] run setblock ~ ~ ~1 minecraft:redstone_block
execute if block ~ ~ ~-1 minecraft:redstone_wire[power=0,north=side] run setblock ~ ~ ~-1 minecraft:redstone_block
execute if block ~-1 ~ ~ minecraft:redstone_wire[power=0,west=side] run setblock ~-1 ~ ~ minecraft:redstone_block
execute if block ~1 ~ ~ minecraft:redstone_wire[power=0,east=side] run setblock ~1 ~ ~ minecraft:redstone_block
