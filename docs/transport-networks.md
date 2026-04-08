# Transport Networks

The `ra_wires` module adds marker-driven liquid, gas, and EU transport nodes.

- Namespace: `ra_wires`
- Give all: `/function ra_wires:items/give_all`
- Runtime architecture: [How It Works](how-it-works.md)

## Block Families

| Family | Blocks | Notes |
|---|---|---|
| Liquid | Copper/Netherite Pipe, Tank, Pump, Valve, Drain | Supports water, lava, XP, milk, powder snow IDs |
| Gas | Copper/Netherite Pipe, Tank, Pump, Valve | Supports steam, smoke, hydrogen, oxygen, chlorine IDs |
| Electric | Copper/Netherite Wire, EU Generator, EU Consumer, EU Switch | Fixed-rate EU generation/transfer/consumption |

## Flow Model

Transfer is fixed-rate and adjacency based:

1. Source buffers fill (`pump_tick`, `generator_tick`, or drain collection).
2. Each source tries immediate neighbors in deterministic axis order.
3. Destination accepts only when enabled, with matching medium for fluid/gas.
4. Amount moved is capped by source amount, transfer rate, and destination free capacity.

Network state is marker-based:

- `data.properties.*` for configuration (`enabled`, `transfer_rate`, `medium_id`, etc.).
- `data.data.*` for runtime buffers (`amount`, `capacity`, `eu`).
- `data.status.*` for goggles/readable diagnostics.

## Medium IDs

### Liquids

- `0`: Empty
- `1`: Water
- `2`: Lava
- `3`: XP
- `4`: Milk
- `5`: Powder Snow

### Gases

- `0`: Empty
- `1`: Steam
- `2`: Smoke
- `3`: Hydrogen
- `4`: Oxygen
- `5`: Chlorine

## Visual Connectivity

`ra_wires:common/update_model_local_and_neighbors` refreshes local connection state on placement, break, and tinker updates.

`ra_lib:transport/update_connection_status` computes nearby node count and writes:

- `data.status.connections`
- `data.status.enabled`

This keeps nearby node status readable and helps prevent confusing stale visuals.

## Goggles and Tinkering

Goggles show transport status lines (medium, amount, EU, active state, drain state).

Tinkering controls:

- Sneak + hold goggles in main hand near a transport marker.
- Regular nodes: toggle `enabled`.
- Pumps/drain source blocks: cycle `medium_id`.

## Liquid Drain Behavior

Drain nodes inspect the block in front:

- If a drainable source exists, they consume it (full source blocks and cauldron states) and fill internal buffer.
- If no valid source or no capacity is available, they set `data.status.drain_state` and emit fallback smoke particles.

## Extending New Media

To add a new liquid or gas type:

1. Add a new ID mapping in `ra_wires:liquid/update_medium_label` or `ra_wires:gas/update_medium_label`.
2. Extend source detection logic in relevant pump/drain functions.
3. Update tinker cycle bounds in `ra_wires:tools/tinker_toggle_target`.
4. Add recipe + advancement files and include the item in `ra_wires:items/give_all`.

---
