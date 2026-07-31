# 🐉 5. Pokémon — The Level-Up Stats Update

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Pokémon** for Harvard University's *CS50's Introduction to 2D Game Development*. This project builds on the top-down RPG engine introduced in Lecture 7, adding a detailed level-up statistics menu to its grid exploration, random encounters and turn-based battle system.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

- To watch my demo, click the link: [Demo Video](https://www.youtube.com/watch?v=wJm1y4kAuOY)

---

## 🚀 Project Overview

The objective of this assignment was to extend the victory and level-up sequence. After the player Pokémon gains enough EXP to level up, the game displays a menu showing the calculation for every increased statistic in the format `X + Y = Z`, where:

- `X` is the Pokémon's original statistic.
- `Y` is the increase awarded during the level up.
- `Z` is the resulting statistic.

### Core Features

- **Level-Up Statistics Menu:** Displays the original value, increase and resulting value for Max HP, Attack, Defence and Speed immediately after the “Level Up” dialogue.
- **Returned Stat Increases:** Uses the values returned by `Pokemon:levelUp()` so that the displayed calculations match the Pokémon's actual stat changes.
- **Cursor-Free Results Display:** Extends the `Selection` class with an optional cursor setting, allowing the statistics menu to display information without behaving like an interactive battle menu.
- **StateStack Integration:** Pushes the level-up dialogue and statistics menu in the correct sequence without interrupting the existing victory flow.
- **2D Grid Exploration:** Supports tile-aligned movement, animated player navigation, obstacle collision and tall-grass encounter zones.
- **Random Encounters:** Uses probability checks on grass tiles to start battles through screen-fade transitions.
- **Turn-Based Combat:** Supports Fight and Run commands, attack sequences, health bars and battle messages.
- **EXP and Stat Progression:** Awards EXP after victories and increases Max HP, Attack, Defence and Speed when a level threshold is reached.
- **Fainting and Blackout Flow:** Handles fainting animations, victory rewards and player-defeat transitions back to the spawn position.

---

## 🎮 Game Controls

| Key | Game Action |
| :--- | :--- |
| `W`, `A`, `S`, `D` / `Arrow Keys` | **Move** across the tilemap |
| `Enter` / `Return` | **Confirm** menu selections and advance dialogue |
| `Arrow Keys` | **Navigate** the battle menu |
| `Escape` | **Terminate** the application |

---

## 🛠️ Built With

- **Language:** Lua
- **Framework:** LÖVE2D
- **Libraries:** `push` for virtual-resolution rendering and `class` for object-oriented structure

---

## 🧠 Core Concepts Explored

- **Stack-Based State Management:** Dialogue boxes, menus and battle states are layered through a shared `StateStack`.
- **Callback-Driven Sequencing:** Completion callbacks ensure that the stat menu appears only after the level-up dialogue closes.
- **Object-Oriented Programming:** Pokémon, menus, selections and states encapsulate their own data and behaviour.
- **Optional UI Behaviour:** A boolean cursor option allows one reusable `Selection` class to support both interactive and informational menus.
- **Turn-Based State Machines:** Separate states coordinate player attacks, opponent turns, battle messages, victory and defeat.
- **Procedural Stat Growth:** Each level awards variable increases while preserving the original and final values for display.
- **Grid Collision and Encounters:** Tile properties control player movement, obstacle boundaries and random battle checks.
- **Tweened Transitions:** Timed animations and fades connect map exploration, battle entry, attacks and fainting sequences.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `src/Pokemon.lua` | Stores Pokémon statistics and EXP, performs level-up calculations and returns each stat increase. |
| `src/states/game/TakeTurnState.lua` | Handles battle turns, victory rewards, level detection and the level-up dialogue/menu sequence. |
| `src/gui/Menu.lua` | Wraps and renders menu items used by the battle and level-up interfaces. |
| `src/gui/Selection.lua` | Manages menu options and supports enabling or disabling the selection cursor. |
| `src/StateStack.lua` | Pushes, updates, renders and removes layered game states. |

### Level-Up Calculation Flow Under the Hood

The level-up flow stores each original statistic, applies the increases returned by `Pokemon:levelUp()`, and formats the values for the results menu:

```lua
-- Store the values before the level-up calculation.
local oldMaxHP = pokemon.maxHP
local oldAttack = pokemon.attack
local oldDefense = pokemon.defense
local oldSpeed = pokemon.speed

-- levelUp() applies the changes and returns the amount gained per stat.
local hpGain, attackGain, defenseGain, speedGain = pokemon:levelUp()

local statLines = {
    string.format('Max HP: %d + %d = %d', oldMaxHP, hpGain, pokemon.maxHP),
    string.format('Attack: %d + %d = %d', oldAttack, attackGain, pokemon.attack),
    string.format('Defense: %d + %d = %d', oldDefense, defenseGain, pokemon.defense),
    string.format('Speed: %d + %d = %d', oldSpeed, speedGain, pokemon.speed)
}
```

The resulting lines are passed to a menu whose `Selection` cursor is disabled, allowing the player to review the changes without selecting an option.

---

## 🚀 How to Run the Game

### Prerequisites

Install the [LÖVE2D framework](https://love2d.org/) for your operating system.

### Running Locally

1. Open a terminal or command prompt.
2. Navigate to the Pokémon project folder:

   ```bash
   cd path/to/your/CS50/pokemon
   ```

3. Start the game:

   ```bash
   love .
   ```

---

## 📚 Course Reference

[CS50's Introduction to Game Development](https://cs50.harvard.edu/games/)
