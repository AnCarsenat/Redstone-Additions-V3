# Redstone Additions V3

**A Complete Redstone Expansion Datapack for Minecraft 1.21+**

[![Minecraft](https://img.shields.io/badge/Minecraft-1.21+-green.svg)](https://www.minecraft.net/)
[![License](https://img.shields.io/badge/License-Free-blue.svg)](LICENSE)

> Transform your redstone creations with logic gates, interactive machines, sensors, and powerful developer tools. All survival-friendly and fully integrated with vanilla Minecraft.

---

## ✨ Features

### 🔵 Logic Gates
- **UNI Gate** - One block, seven modes (AND/OR/NOT/XOR/NAND/NOR/XNOR)
- Compact 3×3×3 multiblock structures
- Detects redstone from all 6 directions
- Cycle modes with the Wrench tool
- Individual gates available for creative mode

### 🏭 Interactive Machines
- **Block Breaker** - Auto-mine blocks
- **Block Placer** - Auto-place blocks
- **Item Pipe** - Transfer items between containers
- **Spitter** - Launch items as entities
- **Pusher** - Push entities upward
- **Breeder** - Automatic animal breeding
- **Infinite Cauldrons** - Water, lava, and snow
- **Message Block** - Display custom messages

### 👁️ Sensors
- **Entity Detector** - Detect entities in range
- **Tag Adder** - Add tags to entities
- **Tag Remover** - Remove tags from entities

### � Wireless Redstone
- **Wireless Emitter** - Transmit redstone signals wirelessly
- **Wireless Receiver** - Receive signals on matching channels
- **Redstone Remote** - Handheld remote to pulse receivers

### 🔧 Tools
- **Wrench** - Cycle block modes and interact with structures
- **Creative Data Handler** - Inspect and edit block properties
- **Redstone Remote** - Control wireless receivers remotely

---

## 🚀 Quick Start

### Installation

1. **Download** the latest release or clone this repository
2. **Copy** `redstone_additions_v3.0.0` folder to your world's `datapacks` folder
3. **Run** `/reload` in-game
4. **Get items:** `/function ra:give_all_items`

### First Steps

```mcfunction
# Get all items (creative)
/function ra:give_all_items

# Get only gates
/function ra_gates:items/give_all

# Get only machines
/function ra_interactive:items/give_all

# Get tools
/function ra:tools/wrench/give
```

---

## 📖 Documentation

**Complete Wiki:** [WIKI.md](WIKI.md)

The wiki includes:
- Detailed block descriptions
- Crafting recipes
- Developer guide
- Code examples
- Technical specifications
- FAQ and troubleshooting

---

## 🎮 Example: UNI Gate

The UNI Gate is the **centerpiece** of Redstone Additions - one block that can be any logic gate:

1. **Place** a UNI Gate (crafted with 8 smooth stone slabs + 1 redstone)
2. **Surround** with iron blocks in a 3×3×3 cube
3. **Cycle modes** using Shift+Right-Click with the Wrench
4. **Connect** redstone inputs from any of the 6 sides
5. **Output** via iron → redstone block transformation

**Modes:** AND → OR → NOT → XOR → NAND → NOR → XNOR → (repeat)

---

## 🔬 Technical Highlights

- **Modular Architecture** - Three namespaces (ra, ra_lib, ra_interactive)
- **Bat-Based Placement** - Survival-compatible custom block placement
- **Entity Markers** - Invisible armor stands track block state
- **Library System** - Reusable orientation, placement, redstone, and inventory systems
- **Performance Optimized** - Efficient selectors and tick management

---

## 🛠️ For Developers

Redstone Additions is built with extensibility in mind. The `ra_lib` namespace provides:

- **Orientation System** - Calculate facing from player rotation
- **Placement System** - Place custom blocks with markers
- **Redstone Detection** - Detect power from all 6 directions
- **Inventory Management** - Programmatic container operations

**See the [Developer Guide](WIKI.md#developer-guide) in the wiki for templates and examples.**

---

## 🐛 Known Issues

- Custom blocks are entities, not true blocks (Minecraft limitation)
- Creative mode breaking doesn't consume the item
- Recommended max: ~1000 custom blocks per world

---

## 📋 Changelog

### V3.0.1 (Current - January 2026)
- ✅ Added Wireless Redstone system (Emitter, Receiver, Remote)
- ✅ Remote now pulses receivers (4-tick duration)
- ✅ Creative Data Handler can now edit all block properties
- ✅ Added [Modify] buttons to CDH property display
- ✅ Added [Edit All] button to CDH menu
- ✅ CDH supports all block properties (channel, distance, extend, pulse, entity_type)
- ✅ Fixed JSON text event syntax (hover_event/click_event)
- ✅ Added missing advancements for all blocks
- ✅ Added ra_wireless namespace with full advancement tree

### V3.0.0 (January 2026)
- ✅ Complete rewrite from V1
- ✅ Added 20+ custom blocks
- ✅ UNI Gate with mode cycling
- ✅ Wrench tool system
- ✅ Fixed all survival duplication bugs
- ✅ Simplified break detection (removed ra_lib removal)
- ✅ Comprehensive wiki documentation
- ✅ Recipe book integration

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Test thoroughly in both creative and survival
4. Submit a pull request

---

## 📄 License

Free to use and modify for personal and server use. Please credit the original author.

---

## 🙏 Acknowledgments

- **Created by:** AnCarsenat
- **Inspired by:** Redstone Additions V1
- **Thanks to:** The Minecraft datapacking community

---

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/AnCarsenat/Redstone-Additions-V3/issues)
- **Wiki:** [WIKI.md](WIKI.md)
- **Repository:** [Redstone-Additions-V3](https://github.com/AnCarsenat/Redstone-Additions-V3)

---

**Happy Redstoning! 🔴⚡**
