scoreboard objectives add elemend_bbf_create minecraft.dropped:minecraft.fire_charge
scoreboard objectives add elemend_bbf_calc dummy
scoreboard objectives add elemend_bbf_item dummy
scoreboard objectives add elemend_bbf_ctime dummy
scoreboard objectives add elemend_bbf_timing dummy

scoreboard players set #elemend_bbf_4 elemend_bbf_calc 4

# tick schedules checks for building and destroying the hopper "Blast furnace output" as well as validating the structure around it.
schedule function elemend_bbf:clock_2_sec 2s

#sets the default to ore doubling, if not set otherwise
execute unless score #elemend_bbf_double elemend_bbf_calc matches 0.. run scoreboard players set #elemend_bbf_double elemend_bbf_calc 1

#tellraw @p {"score":{"name":"@s","objective":"scoreboard"},"color":"dark_red"}