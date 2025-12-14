# /data/ra_interactive/function/custom_blocks/block_breaker/register.mcfunction
# Register block breaker

scoreboard objectives add ra.bb.cooldown dummy

tellraw @a [{"text":"[RA] ","color":"gold"},{"text":"Block Breaker registered","color":"gray"}]
