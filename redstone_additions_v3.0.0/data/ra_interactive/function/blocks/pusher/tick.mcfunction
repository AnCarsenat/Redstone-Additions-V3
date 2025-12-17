# /ra_interactive:blocks/pusher/tick
# Tick all pushers

# Check for break detection
execute as @e[tag=ra.custom_block.pusher] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.pusher] at @s run function ra_interactive:blocks/pusher/on_break

# Decrement cooldown
execute as @e[tag=ra.custom_block.pusher,scores={ra.cooldown=1..}] run scoreboard players remove @s ra.cooldown 1

# Process each pusher - push entities above (only if cooldown is 0)
execute as @e[tag=ra.custom_block.pusher,scores={ra.cooldown=0}] at @s run function ra_interactive:blocks/pusher/process
