# /ra_multiblock:load
# Load multiblock module - register multiblock type data

tellraw @a[tag=ra.debug] [{"text":"[RA] ","color":"gold"},{"text":"Multiblock module loaded","color":"gray"}]

# ============================================================================
# Blast Forge - Direction Data
# All block positions relative to base (0,0,0) for each facing direction
# Keys: furnace, in1, in2, out1, ctrl, smoke (string coords for macros)
#       b1-b4 (corner bricks), f1-f9 (floor), c1-c9 (ceiling)
#       io_inputs, io_outputs, io_controls (compound metadata for entity)
# ============================================================================

data modify storage ra:multiblock bf_dir.north set value {facing:"north",furnace:"~ ~ ~-1",in1:"~-1 ~ ~-1",in2:"~1 ~ ~-1",out1:"~ ~ ~-2",ctrl:"~ ~ ~1",smoke:"~ ~0.5 ~-1",b1:"~-1 ~ ~0",b2:"~1 ~ ~0",b3:"~-1 ~ ~-2",b4:"~1 ~ ~-2",f1:"~-1 ~-1 ~-2",f2:"~0 ~-1 ~-2",f3:"~1 ~-1 ~-2",f4:"~-1 ~-1 ~-1",f5:"~0 ~-1 ~-1",f6:"~1 ~-1 ~-1",f7:"~-1 ~-1 ~0",f8:"~0 ~-1 ~0",f9:"~1 ~-1 ~0",c1:"~-1 ~1 ~-2",c2:"~0 ~1 ~-2",c3:"~1 ~1 ~-2",c4:"~-1 ~1 ~-1",c5:"~0 ~1 ~-1",c6:"~1 ~1 ~-1",c7:"~-1 ~1 ~0",c8:"~0 ~1 ~0",c9:"~1 ~1 ~0",io_inputs:{input_1:{x:-1,y:0,z:-1},input_2:{x:1,y:0,z:-1}},io_outputs:{output_1:{x:0,y:0,z:-2}},io_controls:{redstone_in:{x:0,y:0,z:1}}}

data modify storage ra:multiblock bf_dir.south set value {facing:"south",furnace:"~ ~ ~1",in1:"~1 ~ ~1",in2:"~-1 ~ ~1",out1:"~ ~ ~2",ctrl:"~ ~ ~-1",smoke:"~ ~0.5 ~1",b1:"~-1 ~ ~0",b2:"~1 ~ ~0",b3:"~-1 ~ ~2",b4:"~1 ~ ~2",f1:"~-1 ~-1 ~0",f2:"~0 ~-1 ~0",f3:"~1 ~-1 ~0",f4:"~-1 ~-1 ~1",f5:"~0 ~-1 ~1",f6:"~1 ~-1 ~1",f7:"~-1 ~-1 ~2",f8:"~0 ~-1 ~2",f9:"~1 ~-1 ~2",c1:"~-1 ~1 ~0",c2:"~0 ~1 ~0",c3:"~1 ~1 ~0",c4:"~-1 ~1 ~1",c5:"~0 ~1 ~1",c6:"~1 ~1 ~1",c7:"~-1 ~1 ~2",c8:"~0 ~1 ~2",c9:"~1 ~1 ~2",io_inputs:{input_1:{x:1,y:0,z:1},input_2:{x:-1,y:0,z:1}},io_outputs:{output_1:{x:0,y:0,z:2}},io_controls:{redstone_in:{x:0,y:0,z:-1}}}

data modify storage ra:multiblock bf_dir.east set value {facing:"east",furnace:"~1 ~ ~",in1:"~1 ~ ~-1",in2:"~1 ~ ~1",out1:"~2 ~ ~",ctrl:"~-1 ~ ~",smoke:"~1 ~0.5 ~",b1:"~0 ~ ~-1",b2:"~0 ~ ~1",b3:"~2 ~ ~-1",b4:"~2 ~ ~1",f1:"~0 ~-1 ~-1",f2:"~0 ~-1 ~0",f3:"~0 ~-1 ~1",f4:"~1 ~-1 ~-1",f5:"~1 ~-1 ~0",f6:"~1 ~-1 ~1",f7:"~2 ~-1 ~-1",f8:"~2 ~-1 ~0",f9:"~2 ~-1 ~1",c1:"~0 ~1 ~-1",c2:"~0 ~1 ~0",c3:"~0 ~1 ~1",c4:"~1 ~1 ~-1",c5:"~1 ~1 ~0",c6:"~1 ~1 ~1",c7:"~2 ~1 ~-1",c8:"~2 ~1 ~0",c9:"~2 ~1 ~1",io_inputs:{input_1:{x:1,y:0,z:-1},input_2:{x:1,y:0,z:1}},io_outputs:{output_1:{x:2,y:0,z:0}},io_controls:{redstone_in:{x:-1,y:0,z:0}}}

data modify storage ra:multiblock bf_dir.west set value {facing:"west",furnace:"~-1 ~ ~",in1:"~-1 ~ ~1",in2:"~-1 ~ ~-1",out1:"~-2 ~ ~",ctrl:"~1 ~ ~",smoke:"~-1 ~0.5 ~",b1:"~0 ~ ~-1",b2:"~0 ~ ~1",b3:"~-2 ~ ~-1",b4:"~-2 ~ ~1",f1:"~-2 ~-1 ~-1",f2:"~-2 ~-1 ~0",f3:"~-2 ~-1 ~1",f4:"~-1 ~-1 ~-1",f5:"~-1 ~-1 ~0",f6:"~-1 ~-1 ~1",f7:"~0 ~-1 ~-1",f8:"~0 ~-1 ~0",f9:"~0 ~-1 ~1",c1:"~-2 ~1 ~-1",c2:"~-2 ~1 ~0",c3:"~-2 ~1 ~1",c4:"~-1 ~1 ~-1",c5:"~-1 ~1 ~0",c6:"~-1 ~1 ~1",c7:"~0 ~1 ~-1",c8:"~0 ~1 ~0",c9:"~0 ~1 ~1",io_inputs:{input_1:{x:-1,y:0,z:1},input_2:{x:-1,y:0,z:-1}},io_outputs:{output_1:{x:-2,y:0,z:0}},io_controls:{redstone_in:{x:1,y:0,z:0}}}
