
execute at @e[tag=createLEVER] unless block ~ ~-1 ~ air run setblock ~ ~ ~ lever[face=floor]
execute at @e[tag=createLEVER] unless block ~-1 ~ ~ air run setblock ~ ~ ~ lever[face=wall,facing=east]
execute at @e[tag=createLEVER] unless block ~1 ~ ~ air run setblock ~ ~ ~ lever[face=wall,facing=west]
execute at @e[tag=createLEVER] unless block ~ ~ ~1 air run setblock ~ ~ ~ lever[face=wall,facing=north]
execute at @e[tag=createLEVER] unless block ~ ~ ~-1 air run setblock ~ ~ ~ lever[face=wall,facing=south]
tag @e[tag=createLEVER] remove createLEVER
execute as @e[tag=LEVER] at @s unless block ~ ~ ~ lever run function r:other/eldestroy

tag @e[tag=LEVREC,tag=levrec_on] remove levrec_on
execute as @e[tag=LEVER] at @s if block ~ ~ ~ lever[powered=true] run tag @e[tag=LEVREC,distance=..15,sort=nearest,limit=1] add levrec_on