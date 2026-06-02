\# The Legend of Zelda - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A 2D top-down dungeon crawler action-RPG modeled after the classic Nintendo masterpiece \*\*The Legend of Zelda\*\*, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for robust dungeon state scaling, collision handling matrices, enemy pathfinding AI, and persistent item/pot collection mechanics.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Top-Down Dungeon Exploration:\*\* Navigate a multi-room dungeon map grid featuring sliding screen transitions when walking through doorway thresholds.

\- \*\*Sword Slashing Action:\*\* Fully functional hitbox detection when swinging your sword to clear patrolling enemies.

\- \*\*Enemy AI Routing:\*\* Monsters spawn randomly throughout the dungeon rooms, featuring randomized directional movement routines and wall collision awareness.

\- \*\*Loot Drops \& Consumables:\*\* Defeated monsters have a chance to drop hearts that restore your health points (HP) in real-time.

\- \*\*Pot Lifting \& Throwing:\*\* Lift decorative room pots over your head, walk with them, and hurl them at enemies to deal damage upon impact.



\---



\## 🕹️ Controls



Take control of Link and battle monsters using your keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Movement / Grid Direction\*\* | `W, A, S, D` or `Arrow Keys` |

| \*\*Swing Sword\*\* | `Spacebar` |

| \*\*Lift / Throw Pot\*\* | `E` or `Return` (when standing next to a pot) |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*LÖVE2D\*\* framework and programmed in \*\*Lua\*\*.



\### Prerequisites

Make sure you have LÖVE2D installed on your system:

\- Download it from \[love2d.org](https://love2d.org/) or install it via your package manager.



\### Running Locally

1\. Open your terminal or command prompt and navigate to this specific folder:

```bash

&#x20;  cd path/to/your/CS50/zelda

