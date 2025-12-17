Redstone Interactions: Alpha 1.1
by Moxvallix
https://namemc.com/profile/Moxvallix
moxvallix@gmail.com

Redstone interactions is a datapack library that can be accessed by other datapacks to assist with incorporating redstone to work with custom blocks. It targets entities, such as armor stands, that are tagged with the tag "use_redstone", and detects whether the block they are in is being powered. Whether or not the block is powered is stored in the scoreboard objective "powered". Can also be used to make a block output power, by tagging the block's entity with "power_out".

To detect if entity (@s for example) is powered: /execute if entity @s[scores={powered=15}]
To detect if entity (@s for example) is powered from the east side: /execute if entity @s[tag=powered_east]
To detect if entity (@s for example) is powered by a repeater: /execute if entity @s[tag=rep_powered]
To output power from an entity for 1 second (@s for example):
/scoreboard players set @s tick_delay 20
/tag @s add power_out

Current features:
- Detects buttons, levers, repeaters and redstone dust.
- Ability to make blocks output power for 1 second.
- Outputs power level of 15.
- Custom length for power out.
- Detects which side of block is powered, and tags accordingly (eg. powered_north)
- Detects what different redstone components are powering the block, and tags accordingly (eg. lev_powered)
- Detects the sides that redstone components could power it, and tags accordingly (eg. nearby_south)

Future features:
- Varying levels of redstone output.
- Option to add quasi-connectivity to a block.
- Support for observers (coming very soon).

Feel free to give any suggestions for future features, or extra redstone abilities that could improve the datapack.
