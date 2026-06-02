\# Super Mario Bros. - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A 2D side-scrolling platformer modeled after the iconic Nintendo classic \*\*Super Mario Bros.\*\*, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for robust tilemap generation, chasm generation, custom power-up tracking, key-and-lock level gating, and procedural generation flag-pole victory conditions.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Procedural Level Generation:\*\* Levels generate dynamically with varying terrain, random chasms, brick pillars, and interactive item blocks.

\- \*\*Key and Lock Mechanics:\*\* Levels spawn a hidden Key and a locked Block. Players must hunt down the key to unlock the barrier before the final flagpole will appear.

\- \*\*Dynamic Tilemap Rendering:\*\* Implements complex sprite sheet slicing to handle ground tiles, decorative backgrounds, animation sheets, and breakable bricks.

\- \*\*Goomba AI Obstacles:\*\* Animated enemy characters patrol the platform tiles, changing directions when hitting walls or edges, and can be defeated by jumping directly on top of them.

\- \*\*Flagpole Level Progression:\*\* Reaching the generated flagpole triggers a victory animation state and seamlessly resets the seed to generate a longer, more challenging level layout.



\---



\## 🕹️ Controls



Navigate Mario across the platforms using your keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Move Left\*\* | `Left Arrow Key` or `A` |

| \*\*Move Right\*\* | `Right Arrow Key` or `D` |

| \*\*Jump\*\* | `Spacebar` |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*LÖVE2D\*\* framework and programmed in \*\*Lua\*\*.



\### Prerequisites

Make sure you have LÖVE2D installed on your system:

\- Download it from \[love2d.org](https://love2d.org/) or install it via your package manager.



\### Running Locally

1\. Open your terminal or command prompt and navigate to this specific folder:

```bash

&#x20;  cd path/to/your/CS50/mario

