# Multiblocks

This page documents the multiblock stack currently shipped in source:

- Runtime library: `ra_lib_multiblock`
- Implementations: `ra_multiblock`
- Full architecture: [How It Works](how-it-works.md)

## Base Tiers

`ra_multiblock:blocks/give_all` gives these base items:

- copper_base
- iron_base
- gold_base
- diamond_base
- netherite_base

Each base has a dedicated recipe in `data/ra_multiblock/recipe`.

## Lifecycle

1. Place a base block item.
2. Use Wrench interaction flow to trigger assembly checks.
3. Validation hooks run through `ra_lib_multiblock` and type-specific validators.
4. If valid, a multiblock marker is created and configured.
5. Tick dispatch processes the active multiblock each tick.
6. Structure failure or break event disassembles and cleans up.

Assembly and validity are intentionally separated:

- `ra_lib_multiblock` handles generic lifecycle.
- `ra_multiblock` handles type-specific logic and recipes.

## Implemented Structures

### Blast Forge

Location: `data/ra_multiblock/function/blast_forge`

Includes:

- directional validation and check dispatch
- process logic
- fuel consumption and heat behavior
- recipe matching (`smelting`, `recycling`)

Heat behavior summary:

- Processing requires minimum heat.
- Fuel items increase heat by tier.
- Passive decay reduces heat over time.
- Processing interval scales with heat range.

### Upgrade Platform

Location: `data/ra_multiblock/function/upgrade_platform`

Includes:

- structure validate/check
- tick dispatch
- upgrade recipe execution (`tier_upgrades`)

### Drill (Rock Metallic)

Location: `data/ra_multiblock/function/drills/rock_metallic`

Includes directional and recipe scaffolding similar to blast forge style.

## Data and Direction Sources

Key assets:

- `storage ra:multiblock`
- `data/ra_multiblock/drill_dir.json`

Marker data model contains:

- `data.type`
- `data.facing`
- `data.properties`
- `data.inputs`
- `data.outputs`
- `data.controls`

Type-specific runtime fields are commonly added in `data.data` and `data.status`.

## Hook Surfaces

New multiblock types should integrate through library hook tags:

- `#ra_lib_multiblock:validate`
- `#ra_lib_multiblock:setup_type`
- `#ra_lib_multiblock:check_structure`
- `#ra_lib_multiblock:on_break`

Avoid bypassing these hooks; direct ad-hoc assembly logic tends to break periodic validation and teardown.

## Debug Checklist

1. Confirm base marker exists at the expected position.
2. Confirm only one active multiblock marker occupies the assembly center.
3. Verify validation functions return success before marker setup.
4. Inspect marker `data.type`, `data.facing`, and property fields.
5. If immediate disassembly occurs, inspect periodic structure check path.
6. Verify wrench staging data exists in `storage ra:multiblock` before assembly call.

---
