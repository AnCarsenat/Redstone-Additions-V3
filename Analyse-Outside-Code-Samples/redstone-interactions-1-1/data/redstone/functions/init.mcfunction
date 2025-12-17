scoreboard objectives add powered dummy
scoreboard objectives add tick_delay dummy
scoreboard objectives add tick_delay_count dummy
scoreboard objectives add redstone_install dummy
schedule function redstone:tick_delay 1t
scoreboard players set @a redstone_install 1
