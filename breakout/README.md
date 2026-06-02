# Fifty Bird - CS50 Games

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)

A 2D remake of the mobile hit **Flappy Bird**, developed as part of Harvard's CS50 Introduction to Game Development course. **This implementation received a perfect score of 100%** for meeting all core grading criteria, including infinite procedural obstacle generation, state management, and seamless parallax background scrolling.

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

---

## 🎮 Gameplay & Features

- **Procedural Pipe Generation:** Obstacles spawn dynamically at random heights and randomized intervals to keep gameplay unpredictable.
- **Parallax Scrolling:** Multi-layered backgrounds move at different speeds to create a depth-of-field 2D visual effect.
- **Score Tracking & Medals:** Tracks scores in real-time, awarding different medals based on performance upon reaching the game-over state.
- **State Machine Transitions:** Manages clean transitions across `Countdown`, `Title`, `Play`, `Score`, and `Pause` states.
- **Audio Feedback:** Authentic retro sound effects for jumping, scoring points, and colliding with obstacles.

---

## 🕹️ Controls

Take control of the bird using your keyboard:

| Action | Control Key |
| :--- | :--- |
| **Jump / Flap** | `Spacebar` |
| **Pause / Resume Game** | `P` |
| **Enter / Start Match** | `Enter` |

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites
Make sure you have LÖVE2D installed on your system:
- Download it from [love2d.org](https://love2d.org/) or install it via your package manager.

### Running Locally
1. Open your terminal or command prompt and navigate to this specific folder:
   ```bash
   cd path/to/your/CS50/FlappyBird