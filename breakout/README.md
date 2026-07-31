# 🧱 2. Breakout — Multiball & Locked Brick Update
![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Project 2 (Breakout)** for Harvard University's *CS50's Introduction to Game Development*. This project extends the brick-breaking game introduced in Lecture 2 with multiball gameplay, score-based paddle resizing, locked bricks and collectible key power-ups.

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

- To watch my demo, click the link: [Demo Video](https://www.youtube.com/watch?v=lU3GB7ng0ZE)

---

## 🚀 Project Overview

The objective of this assignment was to understand and extend an existing game codebase without disrupting its original collision, scoring and state-management systems. The update introduces two new falling power-ups, dynamic paddle sizes and a locked-brick mechanic that adds an additional objective to selected levels.

### Core Features Implemented

- **Multiball Power-up:** A falling power-up appears randomly during play. Collecting it with the paddle adds two more active balls.
- **Independent Ball Behaviour:** Every active ball uses the same movement, brick collision, paddle collision and scoring rules as the original ball.
- **Ball Reset Between Levels:** Entering the Victory State resets the collection to one active ball for the next level.
- **Dynamic Paddle Growth:** The paddle grows after the player reaches the required score threshold.
- **Paddle Shrinking:** Losing a life reduces the paddle's size, making recovery more challenging.
- **Size Boundaries:** Paddle resizing is limited by the smallest and largest paddle sprites available in the sprite sheet.
- **Locked Bricks:** Selected levels can contain a locked brick that ordinary ball collisions cannot destroy.
- **Key Power-up:** A collectible key can spawn only when a locked brick exists in the current level.
- **Conditional Brick Unlocking:** After the key is collected, the ball can open the locked brick and complete the remaining level objective.
- **Procedural Level Integration:** Locked bricks appear occasionally through the existing level-generation system rather than being included in every level.

---

## 🎮 Game Controls

| Key | Game Action |
| :--- | :--- |
| `Left Arrow` or `A` | **Move the paddle left** |
| `Right Arrow` or `D` | **Move the paddle right** |
| `Enter` / `Return` | **Start, serve or continue** |
| `Escape` | **Terminate the application** |

---

## 🛠️ Built With

- **Language:** Lua
- **Framework:** LÖVE2D
- **Libraries:** `push` for virtual resolution, `class` for object-oriented structure and `Timer` for tweened transitions
- **Assets:** Sprite sheets for paddles, balls, bricks, locked bricks, keys and power-ups

---

## 🧠 Core Concepts Explored

- **Object-Oriented Design:** Extends the existing game with reusable power-up objects and specialised brick behaviour.
- **Table-Based Entity Management:** Stores and updates several balls and power-ups during the same game loop.
- **Collision Detection:** Checks interactions among balls, bricks, the paddle and falling power-ups.
- **Finite-State Machines:** Preserves the existing serve, play, victory and game-over flow while resetting multiball correctly between levels.
- **Procedural Level Generation:** Adds locked bricks occasionally without requiring them in every generated level.
- **Conditional Spawning:** Allows the key to appear only when the current level contains a locked brick.
- **Bounded Progression:** Changes the paddle size according to score and lost lives while enforcing minimum and maximum sizes.
- **Sprite-Sheet Management:** Uses quads to render the additional locked-brick and power-up graphics from the supplied sprite sheet.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `src/Powerup.lua` | Defines the falling multiball and key power-ups, including movement, rendering and paddle collision. |
| `src/Ball.lua` | Controls each ball's movement, rendering and collision behaviour. |
| `src/Paddle.lua` | Manages paddle movement, sprite size and resizing limits. |
| `src/Brick.lua` | Handles ordinary and locked brick states, collision responses and destruction rules. |
| `src/LevelMaker.lua` | Generates brick layouts and occasionally places a locked brick in a level. |
| `src/states/PlayState.lua` | Updates active balls and power-ups, processes collisions, adjusts paddle size and tracks whether the key has been collected. |
| `src/states/VictoryState.lua` | Prepares the next level and restores the active-ball collection to one ball. |
| `src/Util.lua` | Divides the sprite sheet into quads for paddles, balls, bricks and power-ups. |

### Power-up Collection Under the Hood

The play state checks each falling power-up against the paddle. A multiball power-up creates two additional balls, while a key changes the locked brick's availability. The following simplified example illustrates the required data flow:

```lua
if powerup:collides(self.paddle) then
    if powerup.type == 'multiball' then
        for i = 1, 2 do
            local ball = Ball(math.random(7))
            ball.x = self.paddle.x + self.paddle.width / 2
            ball.y = self.paddle.y - ball.height
            ball.dx = math.random(-200, 200)
            ball.dy = -math.random(50, 60)

            table.insert(self.balls, ball)
        end
    elseif powerup.type == 'key' then
        self.hasKey = true
    end

    powerup.remove = true
end
```

> This example illustrates the assignment's multiball and key flow. Exact class fields and function names may differ in the completed source code.

---

## 🚀 How to Run the Game

### Prerequisites

Install [LÖVE2D](https://love2d.org/) for your operating system.

### Running Locally

1. Open a terminal or command prompt.
2. Navigate to the folder containing the game's `main.lua` file:

   ```bash
   cd path/to/your/CS50/breakout
   ```

3. Run the project with LÖVE2D:

   ```bash
   love .
   ```

---

## Assignment Summary

This project extends the Breakout source code from Lecture 2 by requiring the following additions:

- A randomly spawning power-up that creates two extra balls
- Paddle growth after sufficient scoring and shrinkage after losing a life
- Occasional locked bricks that cannot be destroyed without a key
- A key power-up that spawns only when a locked brick exists
- A reset to one active ball when the player advances through the Victory State

CS50 Games is available in archive form, so this project serves as a practical exercise in understanding and extending an existing game codebase.
