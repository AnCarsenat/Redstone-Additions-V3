tag @s remove elemend_bbf_scheduled

#check if the item is still the same
data remove entity @s data{}
data modify entity @s data set from block ^ ^ ^-1 {}
execute store success score @s elemend_bbf_calc run function elemend_bbf:item/split

#if the item changed in the meantime, reschedule the entry function. "return" makes sure nothing beyond this point will run
execute if score @s elemend_bbf_calc matches 1 run return run function elemend_bbf:input/recipe
#cooktime checks the item being 2 ticks away from being finished smelting
execute if score @s elemend_bbf_calc matches 0 run function elemend_bbf:input/cooktime

#to spawn the output of the smelting recipe that finished now, function tree spawns item
execute if score @s elemend_bbf_calc matches 2 run function elemend_bbf:retrieve/split

#if the lit_time_remaining is not enough to start a next item, stop the function here unless there is more fuel in the furnace
execute store result score #elemend_bbf_end elemend_bbf_calc run data get entity @s data.lit_time_remaining 1
execute if score #elemend_bbf_end elemend_bbf_calc matches ..4 unless predicate elemend_bbf:fuelslot run return run function elemend_bbf:expire

#for smelting the next item, schedule the function after this item finished; in 4 ticks time is 2 ticks into the next smelting-recipe
execute store result score @s elemend_bbf_timing run time query gametime
scoreboard players operation @s elemend_bbf_timing += #elemend_bbf_4 elemend_bbf_calc

execute store result entity @s data.next_item int 1 run scoreboard players get #elemend_bbf_4 elemend_bbf_calc
function elemend_bbf:input/next_item with entity @s data