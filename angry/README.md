\# Angry Birds - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A 2D physics puzzle game modeled after the hit mobile game \*\*Angry Birds\*\*, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for robust rigid-body physics simulation, collision detection filtering, and dynamic camera tracking.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Slingshot Launch Mechanics:\*\* Drag and pull back the alien bird to store kinetic energy and launch it using real-time projectile trajectories.

\- \*\*Destructible Environments:\*\* Physics-based wooden obstacle structures that shatter, collapse, and react dynamically to forces and impacts.

\- \*\*Target Elimination:\*\* Defeat all target monsters on the field by directly striking them or causing structural collapses.

\- \*\*Dynamic Camera Tracking:\*\* A smooth, scrolling camera matrix that follows the bird's position across the horizontal playfield post-launch.

\- \*\*Reset \& Restart:\*\* Instant state reset to reload the level and try different angles and velocities.



\---



\## 🕹️ Controls



Interact with the game using your mouse and keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Aim \& Pull Slingshot\*\* | `Left-Click and Drag` (on the bird) |

| \*\*Launch Bird\*\* | `Release Left-Click` |

| \*\*Pan Camera Manually\*\* | `Left / Right Arrow Keys` (before launch) |

| \*\*Reset Level\*\* | `R` |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*LÖVE2D\*\* framework and uses the \*\*Box2D\*\* physics engine wrapped for \*\*Lua\*\*.



\### Prerequisites

Make sure you have LÖVE2D installed on your system:

\- Download it from \[love2d.org](https://love2d.org/) or install it via your package manager.



\### Running Locally

1\. Open your terminal or command prompt and navigate to this specific folder:

&#x20;  ```bash

&#x20;  cd path/to/your/CS50/angry

