# CS50G Project 0: Pong — The AI Paddle Update 🏓

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Pong** for Harvard University's *CS50's Introduction to Game Development*. This project extends the Pong game introduced in Lecture 0 by adding an AI-controlled paddle that tracks the ball and attempts to return it automatically.

This implementation received a perfect score of **100%** for meeting the project requirements and maintaining reliable game-state and collision behaviour. 🎉

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

- To watch my demo, click the link: [Pong Demo](https://www.youtube.com/watch?v=NIedrSInCYw)

## 🚀 Project Overview

The objective of this assignment was to understand the complete Lecture 0 Pong codebase and replace one paddle's keyboard controls with simple decision-making logic. The AI compares its position with the ball's vertical position and moves up or down to remain aligned with it.

### Core Features Implemented:

* **AI-Controlled Paddle:** The right paddle follows the ball automatically and continually attempts to deflect it.
* **Ball-Tracking Logic:** The AI compares the centre of its paddle with the ball's position before selecting an upward, downward or stationary movement.
* **Classic Two-Dimensional Gameplay:** Players score by sending the ball beyond the opposing paddle.
* **Dynamic Ball Physics:** Paddle collisions reverse the ball's horizontal direction and slightly increase its speed.
* **Collision Detection:** The game detects contact between the ball, paddles and upper or lower screen boundaries.
* **Score Tracking:** Player scores, serving information and winning messages are rendered in real time.
* **Game-State Management:** The game moves between start, serve, play and victory states.
* **Retro Sound Effects:** Separate audio cues play for paddle hits, wall bounces and points scored.

---

## 🎮 Game Controls

| Key Input | Game Action |
| :--- | :--- |
| `W` / `S` | **Move Player 1 Up / Down** |
| `Up Arrow` / `Down Arrow` | **Move Player 2 Up / Down in Manual Mode** |
| `Enter` / `Return` | **Start, Serve or Restart the Game** |
| `Escape` | **Terminate the Application** |

> In AI mode, the right paddle is controlled automatically and does not require player input.

---

## 🛠️ Built With

* **Language:** Lua
* **Framework:** LÖVE2D
* **Libraries:** `push` for virtual resolution and `class` for object-oriented structure
* **Audio:** LÖVE2D audio sources for paddle, wall and scoring sound effects

---

## 🛠️ Core Concepts Explored

* **Basic Game AI:** Conditional logic selects the paddle's movement according to the ball's vertical position.
* **Real-Time Input and Updates:** Keyboard input and AI decisions are processed during each update cycle.
* **Velocity-Based Movement:** Paddles and the ball move according to their horizontal and vertical velocity values.
* **AABB Collision Detection:** Axis-aligned bounding boxes determine whether the ball overlaps a paddle.
* **State Management:** A game-state variable controls starting, serving, active play and victory behaviour.
* **Randomised Serving:** The ball begins each round with a changing vertical direction and serves towards the appropriate player.
* **Difficulty Progression:** The ball accelerates slightly after successful paddle collisions.
* **Virtual Resolution:** The game renders at a consistent retro resolution across different display sizes.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `main.lua` | Initialises the window, assets, scores and game state, then handles input, AI movement, collisions and rendering. |
| `Paddle.lua` | Defines paddle position, dimensions, velocity, boundary checks and rendering behaviour. |
| `Ball.lua` | Defines the ball's position, velocity, reset behaviour, collision checks and rendering. |
| `push.lua` | Maintains the game's virtual resolution and scales it to the active display. |
| `class.lua` | Provides the class system used by the paddle and ball objects. |

### AI Paddle Tracking Under the Hood

The AI checks the ball's vertical position against the centre of the right paddle. It then assigns an upward, downward or stationary velocity while the `Paddle:update` method keeps the paddle within the screen boundaries:

```lua
-- Move the AI paddle towards the ball's vertical position.
local paddleCentre = player2.y + player2.height / 2
local ballCentre = ball.y + ball.height / 2

if ballCentre < paddleCentre then
    player2.dy = -PADDLE_SPEED
elseif ballCentre > paddleCentre then
    player2.dy = PADDLE_SPEED
else
    player2.dy = 0
end
```

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites

Make sure LÖVE2D is installed on your system:

* Download it from [love2d.org](https://love2d.org/) or install it using your package manager.

### Running Locally

1. Clone or download the repository, then navigate to the Pong project folder:

   ```bash
   cd path/to/your/CS50/pong
   ```

2. Run the game using LÖVE2D:

   ```bash
   love .
   ```
