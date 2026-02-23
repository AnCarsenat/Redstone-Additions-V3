# centering the marker in the block:

execute align xyz run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["elemend_bbf_marker"]}

#get rid of the fire charge, so it doesn't summon multiple markers:
kill @s

#update the hopper, naming it Blast Furnace Output and removing the items:
data merge block ~ ~ ~ {Items:[],CustomName:"Furnace Output"}

#play a sound and make some particles to let the player know it succeeded
playsound minecraft:item.firecharge.use block @a[distance=..10] ~ ~ ~ 0.7 0.3 0.5
particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.03 20
particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.02 20 

#if that whole process succeeded, reset the score:
scoreboard players reset @p elemend_bbf_calc