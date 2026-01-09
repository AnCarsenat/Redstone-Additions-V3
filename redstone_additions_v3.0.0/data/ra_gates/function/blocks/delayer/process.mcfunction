# /ra_gates:blocks/delayer/process
# Process Delayer logic. As armor stand, at position.
# Delays redstone signal by configurable amount of ticks

# Get delay amount from properties (default 20 ticks = 1 second)
execute unless data entity @s data.properties.delay run data modify entity @s data.properties.delay set value 20

# If powered and not counting, start countdown
execute if score @s ra.act_red matches 1.. unless entity @s[tag=ra.delaying] run tag @s add ra.delaying
execute if entity @s[tag=ra.delaying] unless data entity @s data.delay_current run data modify entity @s data.delay_current set from entity @s data.properties.delay

# Count down while powered
execute if entity @s[tag=ra.delaying] store result score @s ra.temp run data get entity @s data.delay_current
execute if entity @s[tag=ra.delaying] if score @s ra.temp matches 1.. run scoreboard players remove @s ra.temp 1
execute if entity @s[tag=ra.delaying] store result storage ra:temp delay_val int 1 run scoreboard players get @s ra.temp
execute if entity @s[tag=ra.delaying] run data modify entity @s data.delay_current set from storage ra:temp delay_val

# Output when countdown reaches 0
execute if entity @s[tag=ra.delaying] if score @s ra.temp matches ..0 at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute if entity @s[tag=ra.delaying] if score @s ra.temp matches 1.. at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block

# Reset when power removed
execute if score @s ra.act_red matches 0 if entity @s[tag=ra.delaying] run tag @s remove ra.delaying
execute if score @s ra.act_red matches 0 run data remove entity @s data.delay_current
execute if score @s ra.act_red matches 0 at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
