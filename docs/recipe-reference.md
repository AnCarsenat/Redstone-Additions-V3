# Recipe Reference

This page lists recipe file ownership from `data/*/recipe/*.json`.

For how recipes map into placement and marker runtime behavior, see [How It Works](how-it-works.md).

## Core

- `ra/recipe/goggles.json`

## Logic Gates (`ra_gates`)

- `clock.json`
- `delayer.json`
- `extender.json`
- `randomizer.json`
- `shortener.json`
- `uni_gate.json`

## Interactive Machines (`ra_interactive`)

- `block_breaker.json`
- `block_placer.json`
- `breeder.json`
- `infinite_lava_cauldron.json`
- `infinite_snow_cauldron.json`
- `infinite_water_cauldron.json`
- `item_mover.json`
- `message.json`
- `pusher.json`
- `spitter.json`

Note: `item_pipe` currently has no recipe file in this version.

## Sensors (`ra_sensors`)

- `entity_detector.json`
- `tag_adder.json`
- `tag_remover.json`

## Wireless (`ra_wireless`)

- `emitter.json`
- `receiver.json`
- `remote.json`

## Transport Networks (`ra_wires`)

- `liquid_pipe_copper.json`
- `liquid_pipe_netherite.json`
- `liquid_tank.json`
- `liquid_pump.json`
- `liquid_valve.json`
- `liquid_drain.json`
- `gas_pipe_copper.json`
- `gas_pipe_netherite.json`
- `gas_tank.json`
- `gas_pump.json`
- `gas_valve.json`
- `electric_wire_copper.json`
- `electric_wire_netherite.json`
- `electric_generator.json`
- `electric_consumer.json`
- `electric_switch.json`

## Multiblock Bases (`ra_multiblock`)

- `copper_base.json`
- `iron_base.json`
- `gold_base.json`
- `diamond_base.json`
- `netherite_base.json`

## Validation Tip

After recipe edits:

1. Reload datapack.
2. Verify recipe book unlock path via advancements.
3. Verify output item custom_data and placement tags match placement handlers.

---
