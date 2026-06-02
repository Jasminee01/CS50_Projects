\# Breakout - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A complete 2D implementation of the classic retro brick-breaker \*\*Breakout\*\*, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for meeting all core grading requirements, including procedural level layouts, power-up systems, dynamic paddle scaling, and score-based progression.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Procedural Brick Layouts:\*\* Levels generate dynamically with randomized configurations, tier-based brick strengths, and color-coded score variations.

\- \*\*Power-up Spawning:\*\* Hitting special bricks drops power-ups, including splitting the ball into three independent active balls.

\- \*\*Dynamic Paddle Scaling:\*\* The paddle grows or shrinks in size depending on your current score streaks or life losses to balance difficulty.

\- \*\*Particle System Effects:\*\* Vibrant visual particle bursts explode from bricks upon destruction, reflecting the color of the brick hit.

\- \*\*High Score Persistence:\*\* Saves your top performances to a local file stream so your high scores persist across game restarts.



\---



\## 🕹️ Controls



Take control of your paddle using your keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Move Paddle Left\*\* | `Left Arrow Key` or `A` |

| \*\*Move Paddle Right\*\* | `Right Arrow Key` or `D` |

| \*\*Serve Ball / Select Option\*\* | `Spacebar` |

| \*\*Pause / Resume Game\*\* | `P` |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*LÖVE2D\*\* framework and programmed in \*\*Lua\*\*.



\### Prerequisites

Make sure you have LÖVE2D installed on your system:

\- Download it from \[love2d.org](https://love2d.org/) or install it via your package manager.



\### Running Locally

1\. Open your terminal or command prompt and navigate to this specific folder:

&#x20;  ```bash

&#x20;  cd path/to/your/CS50/breakout

