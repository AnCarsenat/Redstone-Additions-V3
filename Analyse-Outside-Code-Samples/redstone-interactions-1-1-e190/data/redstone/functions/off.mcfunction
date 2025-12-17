#Repeaters
execute if block ~ ~ ~1 minecraft:repeater[powered=true,facing=north,delay=4] run setblock ~ ~ ~1 minecraft:repeater[powered=false,facing=north,delay=4]
execute if block ~ ~ ~-1 minecraft:repeater[powered=true,facing=south,delay=4] run setblock ~ ~ ~-1 minecraft:repeater[powered=false,facing=south,delay=4]
execute if block ~-1 ~ ~ minecraft:repeater[powered=true,facing=east,delay=4] run setblock ~-1 ~ ~ minecraft:repeater[powered=false,facing=east,delay=4]
execute if block ~1 ~ ~ minecraft:repeater[powered=true,facing=west,delay=4] run setblock ~1 ~ ~ minecraft:repeater[powered=false,facing=west,delay=4]

execute if block ~ ~ ~1 minecraft:repeater[powered=true,facing=north,delay=3] run setblock ~ ~ ~1 minecraft:repeater[powered=false,facing=north,delay=3]
execute if block ~ ~ ~-1 minecraft:repeater[powered=true,facing=south,delay=3] run setblock ~ ~ ~-1 minecraft:repeater[powered=false,facing=south,delay=3]
execute if block ~-1 ~ ~ minecraft:repeater[powered=true,facing=east,delay=3] run setblock ~-1 ~ ~ minecraft:repeater[powered=false,facing=east,delay=3]
execute if block ~1 ~ ~ minecraft:repeater[powered=true,facing=west,delay=3] run setblock ~1 ~ ~ minecraft:repeater[powered=false,facing=west,delay=3]

execute if block ~ ~ ~1 minecraft:repeater[powered=true,facing=north,delay=2] run setblock ~ ~ ~1 minecraft:repeater[powered=false,facing=north,delay=2]
execute if block ~ ~ ~-1 minecraft:repeater[powered=true,facing=south,delay=2] run setblock ~ ~ ~-1 minecraft:repeater[powered=false,facing=south,delay=2]
execute if block ~-1 ~ ~ minecraft:repeater[powered=true,facing=east,delay=2] run setblock ~-1 ~ ~ minecraft:repeater[powered=false,facing=east,delay=2]
execute if block ~1 ~ ~ minecraft:repeater[powered=true,facing=west,delay=2] run setblock ~1 ~ ~ minecraft:repeater[powered=false,facing=west,delay=2]

execute if block ~ ~ ~1 minecraft:repeater[powered=true,facing=north,delay=1] run setblock ~ ~ ~1 minecraft:repeater[powered=false,facing=north,delay=1]
execute if block ~ ~ ~-1 minecraft:repeater[powered=true,facing=south,delay=1] run setblock ~ ~ ~-1 minecraft:repeater[powered=false,facing=south,delay=1]
execute if block ~-1 ~ ~ minecraft:repeater[powered=true,facing=east,delay=1] run setblock ~-1 ~ ~ minecraft:repeater[powered=false,facing=east,delay=1]
execute if block ~1 ~ ~ minecraft:repeater[powered=true,facing=west,delay=1] run setblock ~1 ~ ~ minecraft:repeater[powered=false,facing=west,delay=1]

#Redstone
execute if block ~ ~ ~1 minecraft:redstone_block run setblock ~ ~ ~1 minecraft:redstone_wire[power=0,south=side]
execute if block ~ ~ ~-1 minecraft:redstone_block run setblock ~ ~ ~-1 minecraft:redstone_wire[power=0,north=side]
execute if block ~-1 ~ ~ minecraft:redstone_block run setblock ~-1 ~ ~ minecraft:redstone_wire[power=0,west=side]
execute if block ~1 ~ ~ minecraft:redstone_block run setblock ~1 ~ ~ minecraft:redstone_wire[power=0,east=side]

#Comparators
execute if block ~ ~ ~1 minecraft:comparator[powered=true,facing=north] run setblock ~ ~ ~1 minecraft:comparator[powered=false,facing=north]
execute if block ~ ~ ~-1 minecraft:comparator[powered=true,facing=south] run setblock ~ ~ ~-1 minecraft:comparator[powered=false,facing=south]
execute if block ~-1 ~ ~ minecraft:comparator[powered=true,facing=east] run setblock ~-1 ~ ~ minecraft:comparator[powered=false,facing=east]
execute if block ~1 ~ ~ minecraft:comparator[powered=true,facing=west] run setblock ~1 ~ ~ minecraft:comparator[powered=false,facing=west]
