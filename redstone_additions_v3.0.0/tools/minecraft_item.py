"""
Minecraft Item Generator
========================
A Python library for creating and manipulating Minecraft items.
Supports /give commands, /summon commands, and parsing existing commands.

Usage:
    from minecraft_item import Item, Components
    
    # Simple item
    item = Item("diamond", 64)
    print(item.give())
    
    # Item with components
    sword = Item("diamond_sword", components=Components(
        custom_name="Excalibur",
        lore=["Legendary Sword", "Forged in fire"],
        enchantments={"sharpness": 5, "unbreaking": 3}
    ))
    print(sword.give())
"""

from dataclasses import dataclass
from typing import Optional, Dict, List, Any
import re


def to_nbt(value: Any) -> str:
    """Convert any Python value to NBT string format."""
    if isinstance(value, bool):
        return "1b" if value else "0b"
    elif isinstance(value, int):
        return str(value)
    elif isinstance(value, float):
        return f"{value}f"
    elif isinstance(value, str):
        return f'"{value}"'
    elif isinstance(value, list):
        return "[" + ",".join(to_nbt(v) for v in value) + "]"
    elif isinstance(value, dict):
        parts = [f"{k}:{to_nbt(v)}" for k, v in value.items()]
        return "{" + ",".join(parts) + "}"
    return str(value)


@dataclass
class Components:
    """Item components for Minecraft 1.21+"""
    
    # Display
    custom_name: Optional[str] = None          # Display name (plain text, auto-quoted)
    item_name: Optional[str] = None            # Item name override
    lore: Optional[List[str]] = None           # Lore lines (plain text, auto-quoted)
    rarity: Optional[str] = None               # common, uncommon, rare, epic
    
    # Model & Appearance
    custom_model_data: Optional[int] = None    # Custom model data for resource packs
    item_model: Optional[str] = None           # Item model override (1.21.4+)
    enchantment_glint_override: Optional[bool] = None  # Force/remove glint
    dyed_color: Optional[int] = None           # Leather armor color (decimal)
    
    # Enchantments & Modifiers
    enchantments: Optional[Dict[str, int]] = None      # {enchant: level}
    stored_enchantments: Optional[Dict[str, int]] = None  # For enchanted books
    attribute_modifiers: Optional[List[Dict]] = None   # Attribute modifiers
    
    # Durability
    damage: Optional[int] = None               # Current damage
    max_damage: Optional[int] = None           # Max durability
    unbreakable: Optional[bool] = None         # Unbreakable flag
    
    # Stack
    max_stack_size: Optional[int] = None       # Override max stack (1-99)
    
    # Custom Data (for datapacks)
    custom_data: Optional[Dict[str, Any]] = None  # Custom NBT data
    
    # Entity Data (spawn eggs)
    entity_data: Optional[Dict[str, Any]] = None  # Entity to spawn
    
    # Food
    food: Optional[Dict[str, Any]] = None      # {nutrition, saturation, can_always_eat}
    
    # Special
    hide_tooltip: Optional[bool] = None        # Hide entire tooltip
    hide_additional_tooltip: Optional[bool] = None  # Hide additional info
    potion_contents: Optional[Dict] = None     # Potion data
    
    def to_nbt(self) -> str:
        """Convert to NBT component string [key=value,...]"""
        parts = []
        
        # Display components
        if self.custom_name:
            parts.append(f'custom_name="{self.custom_name}"')
        
        if self.item_name:
            parts.append(f'item_name="{self.item_name}"')
        
        if self.lore:
            lore_parts = [f'"{line}"' for line in self.lore]
            parts.append(f"lore=[{','.join(lore_parts)}]")
        
        if self.rarity:
            parts.append(f"rarity={self.rarity}")
        
        # Model & Appearance
        if self.custom_model_data is not None:
            parts.append(f"custom_model_data={self.custom_model_data}")
        
        if self.item_model:
            parts.append(f'item_model="{self.item_model}"')
        
        if self.enchantment_glint_override is not None:
            parts.append(f"enchantment_glint_override={'true' if self.enchantment_glint_override else 'false'}")
        
        if self.dyed_color is not None:
            parts.append(f"dyed_color={self.dyed_color}")
        
        # Enchantments
        if self.enchantments:
            ench_parts = []
            for name, level in self.enchantments.items():
                ench_id = name if ":" in name else f"minecraft:{name}"
                ench_parts.append(f'"{ench_id}":{level}')
            parts.append(f"enchantments={{levels:{{{','.join(ench_parts)}}}}}")
        
        if self.stored_enchantments:
            ench_parts = []
            for name, level in self.stored_enchantments.items():
                ench_id = name if ":" in name else f"minecraft:{name}"
                ench_parts.append(f'"{ench_id}":{level}')
            parts.append(f"stored_enchantments={{levels:{{{','.join(ench_parts)}}}}}")
        
        if self.attribute_modifiers:
            mods = [to_nbt(mod) for mod in self.attribute_modifiers]
            parts.append(f"attribute_modifiers=[{','.join(mods)}]")
        
        # Durability
        if self.damage is not None:
            parts.append(f"damage={self.damage}")
        
        if self.max_damage is not None:
            parts.append(f"max_damage={self.max_damage}")
        
        if self.unbreakable:
            parts.append("unbreakable={}")
        
        # Stack
        if self.max_stack_size is not None:
            parts.append(f"max_stack_size={self.max_stack_size}")
        
        # Custom Data
        if self.custom_data:
            parts.append(f"custom_data={to_nbt(self.custom_data)}")
        
        # Entity Data
        if self.entity_data:
            parts.append(f"entity_data={to_nbt(self.entity_data)}")
        
        # Food
        if self.food:
            food_parts = []
            if "nutrition" in self.food:
                food_parts.append(f"nutrition={self.food['nutrition']}")
            if "saturation" in self.food:
                food_parts.append(f"saturation={self.food['saturation']}f")
            if "can_always_eat" in self.food:
                food_parts.append(f"can_always_eat={'true' if self.food['can_always_eat'] else 'false'}")
            parts.append(f"food={{{','.join(food_parts)}}}")
        
        # Special
        if self.hide_tooltip:
            parts.append("hide_tooltip={}")
        
        if self.hide_additional_tooltip:
            parts.append("hide_additional_tooltip={}")
        
        if self.potion_contents:
            parts.append(f"potion_contents={to_nbt(self.potion_contents)}")
        
        return f"[{','.join(parts)}]" if parts else ""
    
    def is_empty(self) -> bool:
        """Check if all components are None."""
        return all(getattr(self, f.name) is None for f in self.__dataclass_fields__.values())


@dataclass
class Item:
    """Represents a Minecraft item."""
    
    id: str
    count: int = 1
    components: Optional[Components] = None
    
    def __post_init__(self):
        if ":" not in self.id:
            self.id = f"minecraft:{self.id}"
    
    @property
    def short_id(self) -> str:
        return self.id.split(":")[-1]
    
    def give(self, target: str = "@p") -> str:
        """Generate /give command."""
        comp = self.components.to_nbt() if self.components and not self.components.is_empty() else ""
        return f"/give {target} {self.id}{comp} {self.count}"
    
    def summon(self, x="~", y="~", z="~", motion=None, pickup_delay=10, no_gravity=False) -> str:
        """Generate /summon item command."""
        item_parts = [f'id:"{self.id}"', f"count:{self.count}"]
        if self.components and not self.components.is_empty():
            comp = self.components.to_nbt()
            item_parts.append(f"components:{{{comp[1:-1]}}}")
        item_nbt = "{" + ",".join(item_parts) + "}"
        
        entity_parts = [f"Item:{item_nbt}"]
        if motion:
            entity_parts.append(f"Motion:[{motion[0]}d,{motion[1]}d,{motion[2]}d]")
        if pickup_delay:
            entity_parts.append(f"PickupDelay:{pickup_delay}")
        if no_gravity:
            entity_parts.append("NoGravity:1b")
        
        return f"/summon item {x} {y} {z} {{{','.join(entity_parts)}}}"
    
    def to_storage(self) -> str:
        """Generate NBT for ra_lib storage commands."""
        parts = [f'id:"{self.id}"']
        if self.count != 1:
            parts.append(f"count:{self.count}")
        if self.components and not self.components.is_empty():
            comp = self.components.to_nbt()
            parts.append(f"components:{{{comp[1:-1]}}}")
        return "{" + ",".join(parts) + "}"
    
    def ra_lib_give(self, x="~", y="~", z="~") -> str:
        """Generate ra_lib inventory commands."""
        return f"data modify storage ra:inventory item set value {self.to_storage()}\nexecute positioned {x} {y} {z} run function ra_lib:inventory/give_item"
    
    def __repr__(self):
        return f"Item({self.short_id}, {self.count})"


# ============================================
# Convenience Functions
# ============================================

def spawn_egg(entity: str, name: str = None, tags: List[str] = None, nbt: Dict = None) -> Item:
    """Create a custom spawn egg."""
    entity_id = entity if ":" in entity else f"minecraft:{entity}"
    entity_data = {"id": entity_id}
    if tags:
        entity_data["Tags"] = tags
    if nbt:
        entity_data.update(nbt)
    
    comp = Components(entity_data=entity_data)
    if name:
        comp.custom_name = name
    
    return Item(f"{entity.split(':')[-1]}_spawn_egg", components=comp)


def enchanted(item_id: str, enchantments: Dict[str, int], name: str = None, unbreakable: bool = False) -> Item:
    """Create an enchanted item."""
    comp = Components(enchantments=enchantments, unbreakable=unbreakable if unbreakable else None)
    if name:
        comp.custom_name = name
    return Item(item_id, components=comp)


def custom(item_id: str, name: str, lore: List[str] = None, data: Dict = None, model: int = None) -> Item:
    """Create a custom item with name, lore, and data."""
    return Item(item_id, components=Components(
        custom_name=name,
        lore=lore,
        custom_data=data,
        custom_model_data=model
    ))


# ============================================
# Parser
# ============================================

def parse_give(command: str) -> Item:
    """Parse a /give command into an Item."""
    cmd = command.strip().lstrip("/")
    if cmd.startswith("give "):
        cmd = cmd[5:]
    
    parts = cmd.split(" ", 1)
    remaining = parts[1] if len(parts) > 1 else ""
    
    item_id, comp_str, count = "", "", 1
    
    if "[" in remaining:
        idx = remaining.index("[")
        item_id = remaining[:idx]
        depth, end = 0, -1
        for i, c in enumerate(remaining[idx:], idx):
            depth += (c == "[") - (c == "]")
            if depth == 0:
                end = i
                break
        if end != -1:
            comp_str = remaining[idx:end+1]
            after = remaining[end+1:].strip()
            if after:
                try:
                    count = int(after.split()[0])
                except ValueError:
                    pass
    else:
        parts = remaining.split()
        item_id = parts[0] if parts else ""
        if len(parts) > 1:
            try:
                count = int(parts[1])
            except ValueError:
                pass
    
    components = _parse_components(comp_str) if comp_str else None
    return Item(item_id, count, components)


def _parse_components(s: str) -> Components:
    """Parse component string."""
    comp = Components()
    s = s[1:-1] if s.startswith("[") else s
    
    if m := re.search(r'custom_name\s*=\s*"([^"]+)"', s):
        comp.custom_name = m.group(1)
    
    if m := re.search(r'enchantments\s*=\s*{levels\s*:\s*{(.+?)}}', s):
        enchants = {}
        for em in re.finditer(r'"([^"]+)"\s*:\s*(\d+)', m.group(1)):
            enchants[em.group(1).replace("minecraft:", "")] = int(em.group(2))
        comp.enchantments = enchants or None
    
    if m := re.search(r'custom_model_data\s*=\s*(\d+)', s):
        comp.custom_model_data = int(m.group(1))
    
    if m := re.search(r'damage\s*=\s*(\d+)', s):
        comp.damage = int(m.group(1))
    
    if "unbreakable" in s:
        comp.unbreakable = True
    
    if m := re.search(r'rarity\s*=\s*(\w+)', s):
        comp.rarity = m.group(1)
    
    return comp


# ============================================
# Demo
# ============================================

if __name__ == "__main__":
    print("=" * 50)
    print("Minecraft Item Generator")
    print("=" * 50)
    
    # Simple item
    print("\n--- Simple Item ---")
    diamond = Item("diamond", 64)
    print(f"Give: {diamond.give()}")
    print(f"Summon: {diamond.summon()}")
    
    # Enchanted sword
    print("\n--- Enchanted Sword ---")
    sword = Item("diamond_sword", components=Components(
        custom_name="Excalibur",
        lore=["The Legendary Sword", "Forged in Dragon Fire"],
        enchantments={"sharpness": 5, "unbreaking": 3, "fire_aspect": 2},
        unbreakable=True
    ))
    print(f"Give: {sword.give()}")
    
    # Custom model item
    print("\n--- Custom Model Item ---")
    wand = Item("stick", components=Components(
        custom_name="Magic Wand",
        custom_model_data=12345,
        lore=["Right-click to cast"],
        custom_data={"my_pack": {"wand": True, "mana": 100}},
        enchantment_glint_override=True
    ))
    print(f"Give: {wand.give()}")
    
    # Spawn egg
    print("\n--- Custom Spawn Egg ---")
    egg = spawn_egg("bat", "Block Breaker", ["ra.spawned", "ra.place.block_breaker"], {"Silent": True, "NoAI": True})
    print(f"Give: {egg.give()}")
    
    # Convenience functions
    print("\n--- Convenience Functions ---")
    sword2 = enchanted("netherite_sword", {"sharpness": 5, "looting": 3}, "Dragon Slayer", True)
    print(f"Give: {sword2.give()}")
    
    wand2 = custom("blaze_rod", "Fire Staff", ["Burns enemies", "Mana: 50"], {"staff": {"type": "fire"}}, 1001)
    print(f"Give: {wand2.give()}")
    
    # RA_Lib integration
    print("\n--- RA_Lib Commands ---")
    print(wand.ra_lib_give("100", "64", "200"))
    
    # Parse command
    print("\n--- Parse Command ---")
    cmd = '/give @p diamond_sword[custom_name="Test",enchantments={levels:{"minecraft:sharpness":5}}] 1'
    print(f"Original: {cmd}")
    parsed = parse_give(cmd)
    print(f"Parsed: {parsed}")
    print(f"Regenerated: {parsed.give()}")
    
    print("\n" + "=" * 50)
        elif isinstance(value, float):
            return f"{value}f"
        elif isinstance(value, str):
            return f'"{value}"'
        elif isinstance(value, list):
            return "[" + ",".join(self._value_to_nbt(v) for v in value) + "]"
        elif isinstance(value, dict):
            return self._dict_to_nbt(value)
        else:
            return str(value)


@dataclass
class ItemComponents:
    """Represents all possible item components in Minecraft 1.21+"""
    
    custom_name: Optional[str] = None  # JSON text component e.g. '"My Item"' or '{"text":"Name","color":"gold"}'
    lore: Optional[List[str]] = None   # List of JSON text components
    enchantments: Optional[Dict[str, int]] = None  # {enchantment_name: level}
    custom_data: Optional[CustomData] = None
    damage: Optional[int] = None
    max_damage: Optional[int] = None
    unbreakable: Optional[bool] = None
    custom_model_data: Optional[int] = None
    hide_tooltip: Optional[bool] = None
    rarity: Optional[str] = None  # common, uncommon, rare, epic
    enchantment_glint_override: Optional[bool] = None
    max_stack_size: Optional[int] = None
    
    # Food component
    food: Optional[Dict[str, Any]] = None  # {nutrition: int, saturation: float, can_always_eat: bool}
    
    # Entity data (for spawn eggs)
    entity_data: Optional[Dict[str, Any]] = None
    
    # Attribute modifiers
    attribute_modifiers: Optional[List[Dict[str, Any]]] = None
    
    def to_nbt(self) -> str:
        """Convert components to NBT string for commands."""
        parts = []
        
        if self.custom_name is not None:
            parts.append(f"custom_name={self.custom_name}")
        
        if self.lore is not None:
            lore_str = "[" + ",".join(self.lore) + "]"
            parts.append(f"lore={lore_str}")
        
        if self.enchantments is not None:
            ench_parts = []
            for ench, level in self.enchantments.items():
                # Add minecraft: prefix if not present
                ench_id = ench if ":" in ench else f"minecraft:{ench}"
                ench_parts.append(f'"{ench_id}":{level}')
            parts.append(f"enchantments={{levels:{{{','.join(ench_parts)}}}}}")
        
        if self.custom_data is not None:
            parts.append(f"custom_data={self.custom_data.to_nbt()}")
        
        if self.damage is not None:
            parts.append(f"damage={self.damage}")
        
        if self.max_damage is not None:
            parts.append(f"max_damage={self.max_damage}")
        
        if self.unbreakable is not None:
            parts.append(f"unbreakable={{}}" if self.unbreakable else "")
        
        if self.custom_model_data is not None:
            parts.append(f"custom_model_data={self.custom_model_data}")
        
        if self.hide_tooltip is not None and self.hide_tooltip:
            parts.append("hide_tooltip={}")
        
        if self.rarity is not None:
            parts.append(f"rarity={self.rarity}")
        
        if self.enchantment_glint_override is not None:
            parts.append(f"enchantment_glint_override={'true' if self.enchantment_glint_override else 'false'}")
        
        if self.max_stack_size is not None:
            parts.append(f"max_stack_size={self.max_stack_size}")
        
        if self.food is not None:
            food_parts = []
            if "nutrition" in self.food:
                food_parts.append(f"nutrition={self.food['nutrition']}")
            if "saturation" in self.food:
                food_parts.append(f"saturation={self.food['saturation']}f")
            if "can_always_eat" in self.food:
                food_parts.append(f"can_always_eat={'true' if self.food['can_always_eat'] else 'false'}")
            parts.append(f"food={{{','.join(food_parts)}}}")
        
        if self.entity_data is not None:
            entity_nbt = CustomData(self.entity_data).to_nbt()
            parts.append(f"entity_data={entity_nbt}")
        
        if self.attribute_modifiers is not None:
            # Simplified attribute modifier handling
            mods = []
            for mod in self.attribute_modifiers:
                mod_parts = []
                for k, v in mod.items():
                    if isinstance(v, str):
                        mod_parts.append(f'{k}:"{v}"')
                    elif isinstance(v, float):
                        mod_parts.append(f'{k}:{v}f')
                    else:
                        mod_parts.append(f'{k}:{v}')
                mods.append("{" + ",".join(mod_parts) + "}")
            parts.append(f"attribute_modifiers=[{','.join(mods)}]")
        
        # Filter empty parts
        parts = [p for p in parts if p]
        
        return "[" + ",".join(parts) + "]" if parts else ""
    
    def is_empty(self) -> bool:
        """Check if components are empty."""
        return all(
            getattr(self, f.name) is None
            for f in self.__dataclass_fields__.values()
        )


@dataclass
class Item:
    """Represents a Minecraft item."""
    
    item_id: str
    count: int = 1
    components: Optional[ItemComponents] = None
    
    def __post_init__(self):
        # Normalize item_id
        if not self.item_id.startswith("minecraft:"):
            self.item_id = f"minecraft:{self.item_id}"
    
    @property
    def short_id(self) -> str:
        """Get item ID without minecraft: prefix."""
        return self.item_id.replace("minecraft:", "")
    
    def give_command(self, target: str = "@p") -> str:
        """
        Generate a /give command for this item.
        
        Args:
            target: The target selector (default: @p)
        
        Returns:
            The complete /give command string
        """
        components_str = ""
        if self.components and not self.components.is_empty():
            components_str = self.components.to_nbt()
        
        if components_str:
            return f"/give {target} {self.item_id}{components_str} {self.count}"
        else:
            return f"/give {target} {self.item_id} {self.count}"
    
    def summon_command(self, x: str = "~", y: str = "~", z: str = "~", 
                       motion: tuple = (), pickup_delay: int = 3,
                       no_gravity: bool = False) -> str:
        """
        Generate a /summon command for an item entity.
        
        Args:
            x, y, z: Coordinates (can be relative with ~)
            motion: Optional (x, y, z) motion tuple
            pickup_delay: Ticks before item can be picked up
            no_gravity: Whether item should float
        
        Returns:
            The complete /summon command string
        """
        # Build item NBT
        item_nbt_parts = [f'id:"{self.item_id}"', f"count:{self.count}"]
        
        if self.components and not self.components.is_empty():
            comp_str = self.components.to_nbt()
            # Convert [a,b,c] format to components:{a,b,c}
            if comp_str.startswith("[") and comp_str.endswith("]"):
                comp_str = "{" + comp_str[1:-1] + "}"
            item_nbt_parts.append(f"components:{comp_str}")
        
        item_nbt = "{" + ",".join(item_nbt_parts) + "}"
        
        # Build entity NBT
        entity_parts = [f"Item:{item_nbt}"]
        
        if motion:
            entity_parts.append(f"Motion:[{motion[0]}d,{motion[1]}d,{motion[2]}d]")
        
        if pickup_delay is not None:
            entity_parts.append(f"PickupDelay:{pickup_delay}")
        
        if no_gravity:
            entity_parts.append("NoGravity:1b")
        
        entity_nbt = "{" + ",".join(entity_parts) + "}"
        
        return f"/summon item {x} {y} {z} {entity_nbt}"
    
    def to_storage_nbt(self) -> str:
        """
        Generate NBT for use with data modify storage commands.
        Compatible with ra_lib inventory system.
        
        Returns:
            NBT string for storage
        """
        parts = [f'id:"{self.item_id}"']
        
        if self.count != 1:
            parts.append(f"count:{self.count}")
        
        if self.components and not self.components.is_empty():
            comp_str = self.components.to_nbt()
            if comp_str.startswith("[") and comp_str.endswith("]"):
                comp_str = "{" + comp_str[1:-1] + "}"
            parts.append(f"components:{comp_str}")
        
        return "{" + ",".join(parts) + "}"
    
    def ra_lib_give_command(self, x: str = "~", y: str = "~", z: str = "~") -> str:
        """
        Generate commands for ra_lib inventory/give_item function.
        
        Returns:
            The mcfunction commands to give this item to a container
        """
        lines = [
            f"data modify storage ra:inventory item set value {self.to_storage_nbt()}",
            f"execute positioned {x} {y} {z} run function ra_lib:inventory/give_item"
        ]
        return "\n".join(lines)
    
    def __repr__(self) -> str:
        return f"Item({self.short_id}, count={self.count})"


class ItemParser:
    """Parse Minecraft /give commands into Item objects."""
    
    @staticmethod
    def parse_give_command(command: str) -> Item:
        """
        Parse a /give command string into an Item object.
        
        Args:
            command: The /give command (with or without leading /)
        
        Returns:
            An Item object representing the command
        """
        # Remove leading / and 'give ' prefix
        command = command.strip()
        if command.startswith("/"):
            command = command[1:]
        if command.startswith("give "):
            command = command[5:]
        
        # Split into parts: target, item[components], count
        # This is tricky because components can contain spaces in strings
        
        # Find target (first word)
        parts = command.split(" ", 1)
        target = parts[0]  # We ignore target for Item creation
        remaining = parts[1] if len(parts) > 1 else ""
        
        # Parse item ID and optional components
        item_id = ""
        components_str = ""
        count = 1
        
        # Check for components bracket
        if "[" in remaining:
            bracket_start = remaining.index("[")
            item_id = remaining[:bracket_start]
            
            # Find matching bracket (handling nested brackets)
            bracket_count = 0
            bracket_end = -1
            for i, char in enumerate(remaining[bracket_start:], bracket_start):
                if char == "[":
                    bracket_count += 1
                elif char == "]":
                    bracket_count -= 1
                    if bracket_count == 0:
                        bracket_end = i
                        break
            
            if bracket_end != -1:
                components_str = remaining[bracket_start:bracket_end + 1]
                # Get count if present
                after_components = remaining[bracket_end + 1:].strip()
                if after_components:
                    try:
                        count = int(after_components.split()[0])
                    except ValueError:
                        pass
        else:
            # No components
            parts = remaining.split()
            item_id = parts[0]
            if len(parts) > 1:
                try:
                    count = int(parts[1])
                except ValueError:
                    pass
        
        # Parse components if present
        components = None
        if components_str:
            components = ItemParser._parse_components(components_str)
        
        return Item(item_id=item_id, count=count, components=components)
    
    @staticmethod
    def _parse_components(comp_str: str) -> ItemComponents:
        """Parse component string into ItemComponents object."""
        components = ItemComponents()
        
        # Remove outer brackets
        if comp_str.startswith("[") and comp_str.endswith("]"):
            comp_str = comp_str[1:-1]
        
        # Simple parsing - extract known components
        # This is a simplified parser and may not handle all edge cases
        
        # Custom name
        match = re.search(r'custom_name\s*=\s*(["\'].+?["\']|{.+?})', comp_str)
        if match:
            components.custom_name = match.group(1)
        
        # Enchantments
        match = re.search(r'enchantments\s*=\s*{levels\s*:\s*{(.+?)}}', comp_str)
        if match:
            ench_str = match.group(1)
            enchantments = {}
            for ench_match in re.finditer(r'"([^"]+)"\s*:\s*(\d+)', ench_str):
                ench_name = ench_match.group(1).replace("minecraft:", "")
                ench_level = int(ench_match.group(2))
                enchantments[ench_name] = ench_level
            if enchantments:
                components.enchantments = enchantments
        
        # Custom data - simplified extraction
        match = re.search(r'custom_data\s*=\s*({.+?})\s*(?:,|\]|$)', comp_str)
        if match:
            # Note: This is simplified and won't handle deeply nested structures
            data_str = match.group(1)
            # Basic parsing for simple key:value pairs
            try:
                data = ItemParser._parse_simple_nbt(data_str)
                if data:
                    components.custom_data = CustomData(data)
            except:
                pass
        
        # Damage
        match = re.search(r'damage\s*=\s*(\d+)', comp_str)
        if match:
            components.damage = int(match.group(1))
        
        # Custom model data
        match = re.search(r'custom_model_data\s*=\s*(\d+)', comp_str)
        if match:
            components.custom_model_data = int(match.group(1))
        
        # Rarity
        match = re.search(r'rarity\s*=\s*(\w+)', comp_str)
        if match:
            components.rarity = match.group(1)
        
        # Unbreakable
        if 'unbreakable' in comp_str:
            components.unbreakable = True
        
        return components
    
    @staticmethod
    def _parse_simple_nbt(nbt_str: str) -> Dict:
        """Very basic NBT string parser for simple structures."""
        result = {}
        
        # Remove outer braces
        nbt_str = nbt_str.strip()
        if nbt_str.startswith("{") and nbt_str.endswith("}"):
            nbt_str = nbt_str[1:-1]
        
        # This is a very simplified parser
        # It handles: key:value, key:"string", key:1b, key:1
        for match in re.finditer(r'(\w+)\s*:\s*([^,}]+)', nbt_str):
            key = match.group(1)
            value = match.group(2).strip()
            
            # Parse value type
            if value.endswith('b'):
                result[key] = value == '1b' or value == 'true'
            elif value.endswith('f') or value.endswith('d'):
                result[key] = float(value[:-1])
            elif value.startswith('"') and value.endswith('"'):
                result[key] = value[1:-1]
            elif value.isdigit() or (value.startswith('-') and value[1:].isdigit()):
                result[key] = int(value)
            else:
                result[key] = value
        
        return result


# ============================================
# Convenience functions
# ============================================

def create_spawn_egg(name: str, tags: List[str] = [""],
                     entity_nbt: Dict = {}, entity_type:str="minecraft:bat") -> Item:
    """
    Create a custom spawn egg item.
    
    Args:
        entity_type: The entity to spawn (e.g., "bat", "zombie")
        name: Display name for the egg
        tags: Tags to apply to spawned entity
        entity_nbt: Additional NBT for the entity
        egg_type: Override spawn egg type (default: {entity}_spawn_egg)
    
    Returns:
        Item object for the spawn egg
    """
    egg_id = f"{entity_type}_spawn_egg"
    
    entity_data = {"id": f"minecraft:{entity_type}"}
    
    if tags:
        entity_data["Tags"] = tags
    
    if entity_nbt:
        entity_data.update(entity_nbt)
    
    components = ItemComponents(entity_data=entity_data)
    
    if name:
        components.custom_name = f'"{name}"'
    
    return Item(egg_id, components=components)


def create_enchanted_item(item_id: str, enchantments: Dict[str, int],
                          name: str = "", unbreakable: bool = False) -> Item:
    """
    Create an enchanted item.
    
    Args:
        item_id: The item ID
        enchantments: Dict of enchantment_name: level
        name: Optional custom name
        unbreakable: Whether item is unbreakable
    
    Returns:
        Item object
    """
    components = ItemComponents(
        enchantments=enchantments,
        unbreakable=unbreakable if unbreakable else None
    )
    
    if name:
        components.custom_name = f'"{name}"'
    
    return Item(item_id, components=components)


def create_custom_item(item_id: str, name: str, lore: List[str] = [],
                       custom_data: Dict = {}, **kwargs) -> Item:
    """
    Create a custom item with name, lore, and custom data.
    
    Args:
        item_id: The item ID
        name: Display name
        lore: List of lore lines
        custom_data: Custom NBT data dict
        **kwargs: Additional ItemComponents fields
    
    Returns:
        Item object
    """
    components = ItemComponents(
        custom_name=f'"{name}"',
        lore=[f'"{line}"' for line in lore] if lore else None,
        custom_data=CustomData(custom_data) if custom_data else None,
        **kwargs
    )
    
    return Item(item_id, components=components)


# ============================================
# Demo / Examples
# ============================================

if __name__ == "__main__":
    print("=" * 60)
    print("Minecraft Item Generator - Examples")
    print("=" * 60)
    
    # Example 1: Simple item
    print("\n--- Simple Diamond ---")
    diamond = Item("diamond", count=64)
    print(f"Item: {diamond}")
    print(f"Give: {diamond.give_command()}")
    print(f"Summon: {diamond.summon_command()}")
    
    # Example 2: Enchanted sword
    print("\n--- Enchanted Sword ---")
    sword = Item("diamond_sword", components=ItemComponents(
        custom_name='"Excalibur"',
        lore=['"The Legendary Sword"', '"Forged in Dragon Fire"'],
        enchantments={"sharpness": 5, "unbreaking": 3, "fire_aspect": 2},
        unbreakable=True
    ))
    print(f"Item: {sword}")
    print(f"Give: {sword.give_command()}")
    
    # Example 3: Custom spawn egg (like block breaker)
    print("\n--- Custom Spawn Egg ---")
    block_breaker_egg = create_spawn_egg(
        "bat",
        name="Block Breaker",
        tags=["ra.spawned", "ra.place.block_breaker"],
        entity_nbt={"Silent": True, "NoAI": True}
    )
    print(f"Item: {block_breaker_egg}")
    print(f"Give: {block_breaker_egg.give_command()}")
    
    # Example 4: Item with custom data
    print("\n--- Item with Custom Data ---")
    magic_wand = create_custom_item(
        "stick",
        name="Magic Wand",
        lore=["Right-click to cast", "Mana: 100/100"],
        custom_data={"my_datapack": {"wand_type": "fire", "mana": 100, "max_mana": 100}}
    )
    print(f"Item: {magic_wand}")
    print(f"Give: {magic_wand.give_command()}")
    print(f"RA_Lib:\n{magic_wand.ra_lib_give_command('100', '64', '200')}")
    
    # Example 5: Parse existing command
    print("\n--- Parse Give Command ---")
    original_cmd = '/give @p minecraft:diamond_sword[custom_name="Test",enchantments={levels:{"minecraft:sharpness":5}}] 1'
    print(f"Original: {original_cmd}")
    parsed_item = ItemParser.parse_give_command(original_cmd)
    print(f"Parsed: {parsed_item}")
    print(f"Regenerated: {parsed_item.give_command()}")
    
    # Example 6: Summon with motion
    print("\n--- Summon with Motion ---")
    emerald = Item("emerald", count=16)
    print(emerald.summon_command("~", "~1", "~", motion=(0, 0.5, 0), pickup_delay=40))
    
    print("\n" + "=" * 60)
    print("Done!")
