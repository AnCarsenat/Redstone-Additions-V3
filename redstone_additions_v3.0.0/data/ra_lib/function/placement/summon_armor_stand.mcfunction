# Summon armor stand at block position with correct rotation
# Context: at block position
# Uses: storage ra:temp Rotation [yaw, pitch]

# Summon with rotation from storage
$summon armor_stand ~ ~ ~ {NoGravity:1b,Invisible:1b,Marker:1b,Tags:["ra.custom_block","ra.custom_block.$(block_tag)","ra.new"]}

# Apply rotation from storage (Rotation is stored as [yaw, pitch] list)
data modify entity @e[tag=ra.new,limit=1] Rotation set from storage ra:temp Rotation

# Store facing data
execute as @p[tag=ra.placer] run scoreboard players operation @e[tag=ra.new,limit=1] ra.block_facing = @s ra.block_facing

# Remove new tag
tag @e[tag=ra.new] remove ra.new

# Play sound
playsound minecraft:block.stone.place block @a[distance=..16] ~ ~ ~ 1 1