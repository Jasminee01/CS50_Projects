\# Helicopter Game - CS50 Games



!\[Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)



A 3D endless avoider game modeled after the classic flash hit \*\*Helicopter\*\*, developed as part of Harvard's CS50 Introduction to Game Development course. \*\*This implementation received a perfect score of 100%\*\* for implementing procedural obstacle generation, progressive speed scaling, smooth physics handling, and robust collision detection.



Official Course Reference: \[CS50 Games](https://cs50.harvard.edu/games/)



\---



\## 🎮 Gameplay \& Features



\- \*\*Endless Procedural Obstacles:\*\* Pillars and building barriers spawn infinitely ahead at randomized heights and intervals to challenge the player's reflexes.

\- \*\*Progressive Difficulty:\*\* Game speed scales up dynamically over time, increasing the rate at which obstacles approach the longer you survive.

\- \*\*True Lift Physics:\*\* Simple but responsive velocity handling where holding the key applies upward lift, and releasing it lets gravity pull the helicopter down.

\- \*\*Coin Collection \& Scoring:\*\* Pick up coins generated throughout the cavern to boost your high score before a crash occurs.

\- \*\*Explosion Effects:\*\* Dynamic particle bursts and instant state resets trigger upon colliding with walls or structural pillars.



\---



\## 🕹️ Controls



Fly your helicopter using your keyboard:



| Action | Control Input |

| :--- | :--- |

| \*\*Ascend / Apply Lift\*\* | Press and Hold `Spacebar` |

| \*\*Descend / Let Drop\*\* | Release `Spacebar` |

| \*\*Restart Match\*\* | `Enter` |



\---



\## 🚀 How to Run the Game



This game is built using the \*\*Unity\*\* engine and programmed in \*\*C#\*\*.



\### Prerequisites

Make sure you have Unity Hub and the correct editor version installed:

\- Download Unity from \[unity.com](https://unity.com/).



\### Running Locally

1\. Open Unity Hub and click \*\*Add project from disk\*\*.

2\. Select your `helicopter` project directory.

3\. Once the project opens in the Unity Editor, open the main scene folder and press the \*\*Play (▶)\*\* button at the top center.



\---



\## 🛠️ Core Concepts Explored



\* \*\*Component-Based Architecture:\*\* Utilizing Unity's component architecture, attaching custom C# scripts alongside standard components like `Rigidbody` and `BoxCollider`.

\* \*\*Procedural Object Spawning and Destroying:\*\* Instantiating new obstacle prefabs dynamically ahead of the camera viewport while cleanly destroying past obstacles to prevent performance-killing memory leaks.

\* \*\*Velocity-Based Vector Math:\*\* Overriding the Y-axis velocity parameter on the object's `Rigidbody` component to simulate gravity vs. mechanical lift factors smoothly.

