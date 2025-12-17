execute at @e[tag=out_success] run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 redstone_block replace red_carpet
execute at @e[tag=!out_success,tag=out_affect] run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 red_carpet replace redstone_block

execute at @e[tag=out_success] run particle block lime_concrete_powder ~ ~ ~ 0.35 0.35 0.35 0 1 force @a[distance=..15]
execute at @e[tag=!out_success,tag=out_affect] run particle block red_concrete_powder ~ ~ ~ 0.35 0.35 0.35 0 1 force @a[distance=..15]