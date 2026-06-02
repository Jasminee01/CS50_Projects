# Match-3 - CS50 Games

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)

A tile-matching puzzle game implementation modeled after classic puzzle games like *Bejeweled* and *Candy Crush*, developed as part of Harvard's CS50 Introduction to Game Development course. **This implementation received a perfect score of 100%** for robust grid validation math, tweening animations, level progression, shiny block implementations, and ensuring no soft-locks can occur on the board.

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

---

## 🎮 Gameplay & Features

- **Grid Matching Logic:** Detects horizontal and vertical matches of three or more identical tiles, clearing them from the board and updating your score.
- **Dynamic Board Refilling:** When matches are cleared, upper tiles drop down cleanly using smooth interpolation, and new randomized tiles spawn to fill the remaining gaps.
- **Shiny Blocks / Row Clears:** Includes rare, glowing "shiny" tiles that trigger a massive explosion, wiping out an entire row or column instantly when matched.
- **Timer & Progression:** Match tiles quickly to add precious seconds to your countdown timer. Scoring enough points before time runs out advances you to the next level.
- **Soft-lock Detection:** Scans the board configuration automatically; if no valid matching moves remain on the field, the board shuffles itself cleanly to ensure the game stays playable.

---

## 🕹️ Controls

Interact with the puzzle grid using your mouse or keyboard:

| Action | Control Input |
| :--- | :--- |
| **Select / Highlight Tile** | `Left-Click` or `Enter` |
| **Move Selector Grid** | `W, A, S, D` or `Arrow Keys` |
| **Swap Tiles** | Select adjacent tiles sequentially to swap |

---

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites
Make sure you have LÖVE2D installed on your system:
- Download it from [love2d.org](https://love2d.org/) or install it via your package manager.

### Running Locally
1. Open your terminal or command prompt and navigate to this specific folder:
```bash
   cd path/to/your/CS50/match3