execute if block ~ ~ ~1 minecraft:comparator[powered=false,facing=north] run setblock ~ ~ ~1 minecraft:comparator[powered=true,facing=north]
execute if block ~ ~ ~-1 minecraft:comparator[powered=false,facing=south] run setblock ~ ~ ~-1 minecraft:comparator[powered=true,facing=south]
execute if block ~-1 ~ ~ minecraft:comparator[powered=false,facing=east] run setblock ~-1 ~ ~ minecraft:comparator[powered=true,facing=east]
execute if block ~1 ~ ~ minecraft:comparator[powered=false,facing=west] run setblock ~1 ~ ~ minecraft:comparator[powered=true,facing=west]
