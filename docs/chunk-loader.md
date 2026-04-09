# Chunk Loader

The `ra_chunk_loader` module contains one block that force-loads its chunk while powered.

- Namespace: `ra_chunk_loader`
- Give all: `/function ra_chunk_loader:items/give_all`
- Runtime architecture: [How It Works](how-it-works.md)

## Block Summary

| Block        | Item model            | Recipe                                                                                 |
| ------------ | --------------------- | -------------------------------------------------------------------------------------- |
| Chunk Loader | `minecraft:lodestone` | ![Chunk Loader recipe](images/recipes/ra_chunk_loader/chunk_loader.png){ width="220" } |

## Runtime Behavior

Chunk Loader tick logic:

1. Break detection verifies the lodestone still exists.
2. Redstone state is read with `ra_lib:redstone/detect`.
3. Rising edge (`!ra.was_powered` and powered) runs `forceload add ~ ~`.
4. Falling edge (`ra.was_powered` and unpowered) runs `forceload remove ~ ~`.

State tags used:

- `ra.custom_block.chunk_loader`
- `ra.was_powered`

## Usage Notes

- Place one per chunk you want controlled. (use F3+G)
- Power on to lock the chunk loaded.
- Power off to release it.
- Recommended for farms.
