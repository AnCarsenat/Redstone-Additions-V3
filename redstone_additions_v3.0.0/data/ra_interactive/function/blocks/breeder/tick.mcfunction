# /ra_interactive:blocks/breeder/tick
# Tick all breeders

# Check for break detection
execute as @e[tag=ra.custom_block.breeder] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.breeder] at @s run function ra_interactive:blocks/breeder/on_break

# Check for powered dispensers - activate breeding
execute as @e[tag=ra.custom_block.breeder] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:blocks/breeder/on_powered
