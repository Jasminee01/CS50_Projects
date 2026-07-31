# CS50G Project 1: Fifty Bird — The Flappy Bird Update 🐦

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Fifty Bird** for Harvard University's *CS50's Introduction to Game Development*. This project extends the Flappy Bird clone introduced in Lecture 1 by adding random vertical pipe gaps, varied pipe-spawning intervals, performance-based medals and a complete pause system.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

- To watch my demo, click the link: [Fifty Bird Demo](https://www.youtube.com/watch?v=AVR0HOMTzjE&t=1s)

## 🚀 Project Overview

The objective of this assignment was to make the supplied Flappy Bird game less predictable and more complete by varying both pipe gaps and spawning intervals, rewarding the player with a score-based medal and allowing gameplay and music to be paused and resumed without losing progress.

### Core Features Implemented:

* **Randomised Vertical Pipe Gaps:** Each pipe pair receives a different vertical clearance instead of using a fixed 90-pixel gap.
* **Randomised Horizontal Pipe Spacing:** Pipe pairs spawn at varied time intervals instead of appearing exactly every two seconds.
* **Procedural Pipe Generation:** Pipe positions and spacing change continuously to create less predictable flight paths.
* **Tiered Performance Medals:** The score screen awards one of three different medals according to the player's final score.
* **Complete Pause System:** Pressing `P` freezes gameplay and prevents game objects from updating until play resumes.
* **Music and Sound Control:** Pausing plays a sound effect and pauses the music; resuming continues the music from the same position.
* **Pause-Screen Feedback:** A large pause icon appears in the centre of the screen while the game is paused.
* **Parallax Scrolling:** Background and ground layers scroll at different speeds to create visual depth.
* **State Machine Transitions:** The game moves cleanly between the title, countdown, play, pause and score states.

---

## 🎮 Game Controls

| Key Input | Game Action |
| :--- | :--- |
| `Spacebar` | **Jump / Flap** |
| `P` | **Pause / Resume Gameplay and Music** |
| `Enter` | **Start or Restart the Game** |
| `Escape` | **Terminate the Application** |

---

## 🛠️ Built With

* **Language:** Lua
* **Framework:** LÖVE2D
* **Libraries:** `push` for virtual resolution and `class` for object-oriented structure
* **Audio:** LÖVE2D audio sources for music and gameplay sound effects

---

## 🛠️ Core Concepts Explored

* **Procedural Generation:** Random values control pipe positions, vertical gaps and spawning intervals.
* **Timer-Based Spawning:** Elapsed time is compared with a changing interval to determine when the next pipe pair appears.
* **State Machines:** Separate game states organise the title screen, countdown, active gameplay, pause screen and score screen.
* **Pause-State Preservation:** Gameplay updates stop while the current score, bird position, pipes and music position remain unchanged.
* **Score Thresholds:** Conditional logic selects one of three medal images according to the final score.
* **Parallax Scrolling:** Layers move at different speeds to simulate depth in a 2D scene.
* **Collision Detection:** The bird is tested against pipe boundaries and the ground to determine when a round ends.
* **Asset Management:** Images, fonts, music and sound effects are loaded once and reused throughout the game.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `main.lua` | Initialises the window, input handling, global assets, state machine and main game loop. |
| `PipePair.lua` | Coordinates the upper and lower pipes and stores the randomised vertical gap. |
| `states/PlayState.lua` | Handles bird physics, pipe spawning, collisions, scoring and pause controls. |
| `states/ScoreState.lua` | Displays the final score and selects the appropriate performance medal. |

### Random Pipe Generation and Pausing Under the Hood

The following logic illustrates how pipe gaps and spawn intervals can be randomised while the pause input temporarily stops gameplay and music:

```lua
-- Generate a pipe pair with a random vertical gap.
local gapHeight = math.random(80, 120)
table.insert(self.pipePairs, PipePair(y, gapHeight))

-- Pause the game and its music.
if love.keyboard.wasPressed('p') then
    scrolling = false
    gSounds['music']:pause()
    gSounds['pause']:play()
    gStateMachine:change('pause')
end
```

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites

Make sure LÖVE2D is installed on your system:

* Download it from [love2d.org](https://love2d.org/) or install it using your package manager.

### Running Locally

1. Open your terminal or command prompt and navigate to the Fifty Bird project folder:

   ```bash
   cd path/to/your/CS50/flappy
   ```

2. Run the game using LÖVE2D:

   ```bash
   love .
   ```
