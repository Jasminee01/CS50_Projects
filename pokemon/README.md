\# Pokémon - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A 2D top-down role-playing game (RPG) modeled after Nintendo's iconic \*\*Pokémon\*\* series, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for robust tilemap navigation, random encounter calculation routines, menu-driven turn-based combat state handling, and dynamic stat progression.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Top-Down Exploration:\*\* Navigate a classic 2D grid world featuring animated characters, obstacles, and tall grass patches.

\- \*\*Random Turn-Based Encounters:\*\* Walking through tall grass triggers a random probability check to transition seamlessly into a combat stadium interface.

\- \*\*Menu-Driven Battle Mechanics:\*\* Fully functional battle HUD displaying choices to `Fight` or `Run`, tracking Health Points (HP) and leveling bars in real-time.

\- \*\*Procedural Leveling \& Stats:\*\* Defeating wild monsters awards experience points (EXP). Reaching leveling thresholds triggers stat increases across Attack, Defense, Speed, and Maximum HP metrics.

\- \*\*Fainting \& Recovery:\*\* Cleanly handles victory states, player defeat blackouts, and screen fading logic transitions.



\---



\## 🕹️ Controls



Navigate the map and control menu interfaces using your keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Movement / Directional Grid\*\* | `W, A, S, D` or `Arrow Keys` |

| \*\*Select Menu Option / Confirm\*\* | `Enter` or `Spacebar` |

| \*\*Navigate Battle Menu\*\* | `Arrow Keys` |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*LÖVE2D\*\* framework and programmed in \*\*Lua\*\*.



\### Prerequisites

Make sure you have LÖVE2D installed on your system:

\- Download it from \[love2d.org](https://love2d.org/) or install it via your package manager.



\### Running Locally

1\. Open your terminal or command prompt and navigate to this specific folder:

```bash

&#x20;  cd path/to/your/CS50/pokemon

