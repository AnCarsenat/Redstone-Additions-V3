
#execute as @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] at @s run setblock ^ ^ ^1 wheat[stage=0] keep

# Bees, Pandas, and Turtles cannot be auto-bred

# Cow (wheat)
execute as @e[type=cow,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=cow,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:wheat",count:1}},distance=..2]

execute as @e[type=cow,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal
# Goat (wheat)
execute as @e[type=goat,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=goat,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:wheat",count:1}},distance=..2]

execute as @e[type=goat,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal
# Pig (potato, carrot, beetroot)
execute as @e[type=pig,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:potato",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=pig,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:potato",count:1}},distance=..2]
execute as @e[type=pig,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:beetroot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=pig,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:beetroot",count:1}},distance=..2]
execute as @e[type=pig,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:carrot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=pig,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:carrot",count:1}},distance=..2]

execute as @e[type=pig,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal
# Chicken (wheat seeds, melon seeds, pumpkin seeds, beetroot seeds)
execute as @e[type=chicken,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat_seeds",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=chicken,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:wheat_seeds",count:1}},distance=..2]
execute as @e[type=chicken,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:melon_seeds",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=chicken,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:melon_seeds",count:1}},distance=..2]
execute as @e[type=chicken,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:pumpkin_seeds",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=chicken,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:pumpkin_seeds",count:1}},distance=..2]
execute as @e[type=chicken,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:beetroot_seeds",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=chicken,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:beetroot_seeds",count:1}},distance=..2]

execute as @e[type=chicken,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Mooshroom (wheat)
execute as @e[type=mooshroom,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=mooshroom,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:wheat",count:1}},distance=..2]

execute as @e[type=mooshroom,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Sheep (wheat)
execute as @e[type=sheep,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:wheat",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=sheep,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:wheat",count:1}},distance=..2]

execute as @e[type=sheep,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Cats (cod, salmon)
execute as @e[type=cat,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:cod",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=cat,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:cod",count:1}},distance=..2]
execute as @e[type=cat,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:salmon",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=cat,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:salmon",count:1}},distance=..2]

execute as @e[type=cat,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Cats (cod, salmon)
execute as @e[type=ocelot,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:cod",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=ocelot,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:cod",count:1}},distance=..2]
execute as @e[type=ocelot,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:salmon",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=ocelot,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:salmon",count:1}},distance=..2]

execute as @e[type=ocelot,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal


# Wolves (raw chicken, raw beef, raw porkchop, raw rabbit, raw mutton, rotten flesh)
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_chicken",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_chicken",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_beef",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_beef",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_porkchop",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_porkchop",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_rabbit",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_rabbit",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_mutton",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_mutton",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:rotten_flesh",count:1}},distance=..2]
execute as @e[type=wolf,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:raw_rabbit",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=wolf,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:raw_rabbit",count:1}},distance=..2]

execute as @e[type=wolf,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Donkeys (golden carrots, golden apples)
execute as @e[type=donkey,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=donkey,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}},distance=..2]
execute as @e[type=donkey,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:golden_apple",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=donkey,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:golden_apple",count:1}},distance=..2]

execute as @e[type=donkey,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Horses (golden carrots, golden apples)
execute as @e[type=horse,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=horse,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}},distance=..2]
execute as @e[type=horse,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:golden_apple",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=horse,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:golden_apple",count:1}},distance=..2]

execute as @e[type=horse,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Foxes (sweet berries)
execute as @e[type=fox,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:sweet_berries",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=fox,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:sweet_berries",count:1}},distance=..2]

execute as @e[type=fox,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Llamas (hay bales)
execute as @e[type=llama,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:hay_block",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=llama,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:hay_block",count:1}},distance=..2]

execute as @e[type=llama,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Rabbit (golden carrots, carrots, dandelions)
execute as @e[type=rabbit,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=rabbit,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:golden_carrot",count:1}},distance=..2]
execute as @e[type=rabbit,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:carrot",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=rabbit,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:carrot",count:1}},distance=..2]
execute as @e[type=rabbit,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:dandelion",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=rabbit,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:dandelion",count:1}},distance=..2]

execute as @e[type=rabbit,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Striders (warped fungus)
execute as @e[type=strider,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:warped_fungus",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=strider,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:warped_fungus",count:1}},distance=..2]

execute as @e[type=strider,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

# Hoglins (crimson fungus)
execute as @e[type=hoglin,nbt={InLove:0,Age:0},distance=..2,sort=random,limit=1] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:crimson_fungus",count:1}}] run data merge entity @s {InLove:1200}
execute as @e[type=hoglin,nbt={InLove:1200},distance=..2,sort=random,limit=1] run kill @n[type=item,nbt={Item:{id:"minecraft:crimson_fungus",count:1}},distance=..2]

execute as @e[type=hoglin,nbt={InLove:1200}] run particle heart ~ ~ ~ 0.25 0.25 0.25 1 7 normal

scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] redstone_additions.temp
scoreboard players add @e[tag=reddition.has_cooldown] redstone_additions.delay 1