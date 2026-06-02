# Pong - CS50 Games

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)

A modern reconstruction of the classic arcade game **Pong**, developed as part of Harvard's CS50 Introduction to Game Development course. **This implementation received a perfect score of 100%** for meeting all core grading criteria, robust physics implementation, and flawless state management.

---

## 🎮 Gameplay & Features

- **Classic 2D Arcade Action:** Two players compete to bounce a ball past each other's paddles.
- **Dynamic Ball Physics:** The ball accelerates slightly with each successful paddle hit to increase intensity.
- **Score Tracking:** Real-time rendering of player scores, winning conditions, and game-state transitions.
- **Sound Effects:** Retro audio cues triggered during paddle deflections, wall bounces, and scoring events.
- **AI Mode (Optional/Extension):** Left paddle controlled manually, right paddle powered by tracking logic.

---

## 🕹️ Controls

Take control of the paddles using your keyboard:

| Action | Player 1 (Left) | Player 2 (Right) / AI |
| :--- | :--- | :--- |
| **Move Up** | `W` | `Up Arrow` |
| **Move Down**| `S` | `Down Arrow` |
| **Serve / Restart** | `Enter` | `Enter` |

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites
Make sure you have LÖVE2D installed on your system:
- Download it from [love2d.org](https://love2d.org/) or install it via your package manager.

### Running Locally
1. Clone or download your CS50 repository to your machine.
2. Open your terminal or command prompt and navigate to this folder:
   ```bash
   cd path/to/your/CS50/Pong