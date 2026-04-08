# Wireless Redstone

The `ra_wireless` module links emitters, receivers, and a handheld remote by channel.

- Namespace: `ra_wireless`
- Give all: `/function ra_wireless:items/give_all`
- Runtime architecture: [How It Works](how-it-works.md)

## Channel Model

Channels are string identifiers in current code (default is `"default"`).

- Emitter property: `data.properties.channel`
- Receiver property: `data.properties.channel`
- Remote item channel: `SelectedItem.components.minecraft:custom_data.ra.channel`

Matching is exact string equality.

## Block and Tool Summary

| Item | Model | Recipe | Trigger model | Key properties |
|---|---|---|---|---|
| Wireless Emitter | `minecraft:end_stone_bricks` | Yes | While powered | `channel`, `enabled` |
| Wireless Receiver | `minecraft:purpur_block` | Yes | Continuous listen | `channel`, `enabled` |
| Redstone Remote | `minecraft:red_dye` item model on blaze rod | Yes | Right-click pulse | item channel string |

## Wireless Emitter

Emitter behavior:

1. Runs `ra_lib:redstone/detect` and reads aggregate power from `ra.power`.
2. If `enabled=1b` and powered, adds `ra.transmitting` tag.
3. If unpowered, removes `ra.transmitting`.

## Wireless Receiver

Receiver behavior:

1. If disabled, forces output off and returns.
2. If tagged `ra.pulsing`, outputs on and decrements `ra.pulse_timer`.
3. If not pulsing, scans transmitting emitters for channel match.
4. Sets output shell on when receiving, off otherwise.

## Redstone Remote

Remote controls:

- Right-click: pulse receivers on matching channel.
- Sneak + right-click: open channel prompt (`suggest_command`) for `/function ra_wireless:tools/remote/set_channel {channel:"..."}`.

Remote pulse details:

- Matching receivers get `ra.pulsing`.
- Pulse timer is set to 4 ticks.

## Practical Setup

1. Place an Emitter and Receiver.
2. Keep both on the same channel string (for example `main`).
3. Power the Emitter or pulse via Remote.
4. Receiver output mirrors powered transmission or 4 tick remote pulses.

## Contributor Notes

1. Channels are strings, not numeric IDs.
2. Keep emitter/receiver channel equality checks exact.
3. Any channel UX changes must update both block properties and remote item custom_data logic.

---
