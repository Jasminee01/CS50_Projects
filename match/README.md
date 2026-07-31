# 💎 4. Match-3 — The Mouse & Shiny Update 💎

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Project 3 (Match-3)** for Harvard University's *CS50's Introduction to 2D Game Development*. This project upgrades the puzzle engine introduced in Lecture 3 by adding mouse controls, strict swap validation, destructive shiny tiles, timed rewards, level-based tile patterns and automatic deadlock recovery.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

- To watch my demo, click the link: [Demo Video](https://www.youtube.com/watch?v=k1g33ISaZxM)

## 🚀 Project Overview

The objective of this assignment was to refine the tile-matching grid into a polished puzzle game that enforces valid moves, rewards successful matches and ensures that every generated board remains playable.

### Core Features Implemented

* **Mouse Input Mapping:** Uses `push:toGame(x, y)` to translate display coordinates into virtual game coordinates for accurate tile selection and drag-swapping.
* **Strict Swap Validation:** A swap is accepted only when it creates a match of three or more tiles. Invalid swaps are automatically reversed and an error sound is played.
* **Destructive Shiny Tiles:** Rare shiny versions of ordinary tiles can appear on the board. Matching one clears its full row or column and awards points for the additional tiles removed.
* **Time Addition Mechanics:** Every cleared tile adds **one second** to the countdown timer.
* **Level-Based Tile Varieties:** Level 1 begins with simple flat tiles. Later levels introduce patterned varieties with higher point values.
* **Match Detection and Refilling:** Horizontal and vertical matches are removed before the remaining tiles fall into place and new tiles refill the grid through tweened animations.
* **Deadlock Detection:** The board tests possible adjacent swaps. If no valid move remains, it automatically generates a new playable board.

---

## 🎮 Game Controls

| Key / Mouse Input | Game Action |
| :--- | :--- |
| `Left Mouse Click` / `Drag` | **Select or swap a tile** |
| `Arrow Keys` | **Move the tile selector** |
| `Enter` / `Return` | **Select a tile or confirm a menu option** |
| `Escape` | **Terminate the application** |

---

## 🛠️ Built With

* **Language:** Lua
* **Framework:** LÖVE2D
* **Libraries:** `push` for virtual resolution and coordinate mapping, `Timer` for tween animations

---

## 🧠 Core Concepts Explored

* **Two-Dimensional Grid Management:** Stores, selects and swaps tiles using row and column indices.
* **Pattern Detection:** Scans the board horizontally and vertically for sequences of three or more matching colours.
* **Coordinate Translation:** Converts physical window coordinates into the game's virtual coordinate system and then into board positions.
* **Move Validation:** Simulates adjacent swaps to verify player moves and detect whether a board contains any legal matches.
* **State Management:** Coordinates selection, swapping, match removal, falling tiles, refilling and level transitions.
* **Tweened Animation:** Smoothly moves swapped and falling tiles without blocking the game loop.
* **Procedural Difficulty:** Expands the available tile patterns according to the current level and adjusts their score values.
* **Special-Tile Behaviour:** Uses a shiny flag to extend the normal match-clearing rules without creating a separate tile type.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `src/Tile.lua` | Stores tile position, colour, pattern variety and shiny status. |
| `src/Board.lua` | Generates the grid and handles match detection, swap validation, shiny clears, falling tiles, refilling and deadlock checks. |
| `src/states/PlayState.lua` | Processes keyboard and mouse input while coordinating scoring, time bonuses, animations and level progression. |

### Mouse Mapping and Swap Validation Under the Hood

The mouse position is converted from window space into the virtual resolution before being mapped to a board row and column. After two adjacent tiles are swapped, the board checks for a match and reverses the move if none exists:

```lua
-- Translate the mouse position into virtual game coordinates.
local mouseX, mouseY = push:toGame(love.mouse.getPosition())

local gridX = math.floor((mouseX - BOARD_OFFSET_X) / 32) + 1
local gridY = math.floor((mouseY - BOARD_OFFSET_Y) / 32) + 1

-- Attempt the swap and reverse it when it creates no match.
self:swapTiles(tile1, tile2)

if not self:calculateMatches() then
    self:swapTiles(tile1, tile2)
    gSounds['error']:play()
end
```

---

## 🚀 How to Run the Game

### Prerequisites

Install [LÖVE2D](https://love2d.org/) for your operating system.

### Running Locally

1. Open a terminal or command prompt.
2. Navigate to the folder containing the game's `main.lua` file:

   ```bash
   cd path/to/your/match
   ```

3. Run the project with LÖVE2D:

   ```bash
   love .
   ```
