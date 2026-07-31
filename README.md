# CS50 Games Portfolio

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![LÖVE2D](https://img.shields.io/badge/L%C3%96VE2D-EA316E?style=for-the-badge&logo=love&logoColor=white)
![C%23](https://img.shields.io/badge/C%23-512BD4?style=for-the-badge&logo=csharp&logoColor=white)
![Unity](https://img.shields.io/badge/Unity-000000?style=for-the-badge&logo=unity&logoColor=white)

A collection of projects completed for Harvard University's **CS50's Introduction to Game Development**. The repository follows the course's progression from small 2D arcade games in Lua and LÖVE2D to 3D projects developed with C# and Unity.

[Official CS50 Games course page](https://cs50.harvard.edu/games/) · [Final Project specification](https://cs50.harvard.edu/games/2018/final/)

---

## Projects

| Project | Game | Main Extension | Technology | Grade |
| :---: | :--- | :--- | :--- | :---: |
| 0 | [Pong](Pong_README.md) | AI-controlled paddle that tracks and returns the ball | Lua / LÖVE2D | 100% |
| 1 | [Fifty Bird](Fifty_Bird_README.md) | Gameplay, scoring and state-management improvements | Lua / LÖVE2D | 100% |
| 3 | [Match-3](Match_3_README.md) | Valid-swap checking, shiny tiles, mouse input and deadlock resets | Lua / LÖVE2D | 100% |
| 4 | [Mario](Mario_README.md) | Keys, locks, goal posts and progressively longer levels | Lua / LÖVE2D | 100% |
| 5 | [Legend of Zelda](Legend_of_Zelda_README.md) | Healing hearts, throwable pots and a Boomerang system | Lua / LÖVE2D | 100% |
| 6 | [Angry Birds](Angry_Birds_README.md) | Destructible obstacles with progressive damage states | Lua / LÖVE2D / Box2D | 100% |
| 7 | [Pokémon](Pokemon_README.md) | Level-up menu showing each stat increase and result | Lua / LÖVE2D | 100% |
| 8 | [Helicopter 3D](Helicopter_3D_README.md) | Procedural spawning, collectables and endless-runner systems | C# / Unity | 100% |
| 9 | [Dreadhalls](Dreadhalls_README.md) | Floor hazards, maze tracking and a separate Game Over scene | C# / Unity | — |

Each project README contains its gameplay features, controls, architecture, core concepts and local setup instructions.

---

## Technologies

- **Lua and LÖVE2D:** 2D gameplay, animation, collision detection, state machines and virtual-resolution rendering
- **C# and Unity:** 3D movement, physics, procedural generation, scene management and UI
- **Box2D:** Physics-based gameplay and object interactions
- **Git and GitHub:** Version control and project documentation

---

## Concepts Explored

- Game loops and frame-rate-independent movement
- Object-oriented and component-based design
- Finite-state machines and scene transitions
- Collision detection and physics
- Procedural level and object generation
- Animation, audio and user-interface systems
- Artificial intelligence and turn-based combat
- Scoring, progression and persistent game state

---

## Personal Challenges and Lessons Learned

This course was my first experience working extensively with code that I had not written myself. Before implementing each update, I had to spend a significant amount of time reviewing the existing code and understanding how its different parts worked together. This was sometimes tedious and difficult, but it was necessary. When I attempted to make changes without first understanding the code, I often struggled to implement the update effectively.

After Project 1, I changed my approach. Before starting an update, I carefully reviewed the relevant code and wrote down important logic, class relationships and game-loop conditions in a notebook. I kept these notes beside me while working so that I could refer to them throughout the implementation.

This experience taught me the importance of understanding the existing development environment before jumping straight into a solution. It improved my ability to navigate unfamiliar codebases, trace how different systems interact and implement changes that fit the existing design.

---

## Running the Projects

### Lua and LÖVE2D projects

1. Install [LÖVE2D](https://love2d.org/).
2. Open a terminal in the selected project directory.
3. Run:

```bash
love .
```

### C# and Unity projects

1. Install the Unity version required by the selected project.
2. Open the project folder through Unity Hub.
3. Open the starting scene and press **Play**.

Refer to the individual project README for project-specific controls and setup details.

---

## Demo Videos

- [Pong](https://www.youtube.com/watch?v=NIedrSInCYw)
- [Fifty Bird](https://www.youtube.com/watch?v=lU3GB7ng0ZE&t=1s)
- [Legend of Zelda](https://www.youtube.com/watch?v=NIedrSInCYw)

Additional demo links can be found in the project folders
