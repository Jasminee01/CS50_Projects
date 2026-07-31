# Mario - CS50 Games

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Mario** for Harvard University's *CS50's Introduction to Game Development*. This project extends the platformer introduced in Lecture 4 with safe player spawning, matching keys and locks, a dynamically generated goal post, and progressively longer levels.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

- To watch my demo, click the link: [Demo Video](https://www.youtube.com/watch?v=UNFPAljRVXc)

---

## 🚀 Project Overview

The objective of this assignment was to extend the supplied side-scrolling platformer with a complete level-progression loop. The player must find a randomly coloured key, use it to remove the matching lock block, reach the newly spawned goal post, and continue into a longer level while retaining their score.

### Core Features Implemented

- **Safe Player Spawning:** Searches the generated map for solid ground and places the player above a valid platform instead of over a chasm.
- **Randomly Coloured Keys:** Generates a collectible key with a randomly selected colour during level creation.
- **Matching Lock Blocks:** Creates a lock block that matches the key's colour and only disappears after the correct key has been collected.
- **Goal-Post Generation:** Spawns the flag and pole segments at the end of the level after the lock has been opened.
- **Progressive Level Length:** Reloads the play state with a larger map whenever the player reaches the goal post.
- **Persistent Score:** Passes the player's score into each newly generated level so progress is retained.
- **Procedural Level Generation:** Builds terrain, chasms, platforms, blocks, keys and locks from generated map data.
- **Platforming Mechanics:** Supports running, jumping, collision detection, object collection and side-scrolling camera movement.

---

## 🎮 Game Controls

| Key | Game Action |
| :--- | :--- |
| `Left Arrow` or `A` | **Move Left** |
| `Right Arrow` or `D` | **Move Right** |
| `Spacebar` | **Jump** |
| `Enter` | **Start the Game** |
| `Escape` | **Terminate the Application** |

---

## 🛠️ Built With

- **Language:** Lua
- **Framework:** LÖVE2D
- **Libraries:** `push` for virtual resolution and `class` for object-oriented structure
- **Assets:** Tile maps, character sprites, keys, locks, flags and environmental objects

---

## 🛠️ Core Concepts Explored

- **Procedural Generation:** Constructs different terrain, object and enemy layouts whenever a level is loaded.
- **Tile-Based Collision Detection:** Uses solid tile data to support movement and guarantee a safe spawn position.
- **Entity and Object Callbacks:** Runs key collection, lock collision and goal completion logic through object callbacks.
- **State Machines:** Separates player behaviour and game flow into manageable states.
- **Parameter Passing:** Transfers the score and level width when re-entering the play state.
- **Progressive Difficulty:** Increases the map width after each completed level.
- **Sprite-Sheet Rendering:** Selects the correct frames for keys, locks, flags, tiles and animated entities.
- **Camera Scrolling:** Follows the player through levels that extend beyond the visible window.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `src/LevelMaker.lua` | Generates terrain and places the matching key, lock block and goal-post objects. |
| `src/states/game/PlayState.lua` | Creates each level, locates a safe player spawn and preserves the score and level width between stages. |
| `src/GameObject.lua` | Defines interactive level objects and their collision or consumption callbacks. |
| `src/Player.lua` | Manages player movement, object interactions and state transitions. |

### The Level Progression System Under the Hood

The play state receives the player's current score and map width whenever a new level begins. Reaching the goal reloads the state with a longer map while preserving the score:

```lua
function PlayState:enter(params)
    self.score = params.score or 0
    self.levelWidth = params.levelWidth or 100
    self.level = LevelMaker.generate(self.levelWidth)
end

-- Called when the player reaches the goal post.
gStateMachine:change('play', {
    score = self.score,
    levelWidth = self.levelWidth + 10
})
```

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites

Install LÖVE2D from [love2d.org](https://love2d.org/) or through your operating system's package manager.

### Running Locally

1. Open a terminal or command prompt.
2. Navigate to the Mario project folder:

   ```bash
   cd path/to/your/CS50/mario
   ```

3. Run the project:

   ```bash
   love .
   ```
