# /ra_interactive:blocks/breeder/tick
# Tick all breeders

# Check for break detection
execute as @e[tag=ra.custom_block.breeder] at @s unless block ~ ~ ~ dispenser run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.breeder] at @s run function ra_interactive:blocks/breeder/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.breeder] remove ra.broken

# Check for powered dispensers - activate breeding
execute as @e[tag=ra.custom_block.breeder] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:blocks/breeder/on_powered
