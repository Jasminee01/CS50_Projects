# 🗡️ Legend of Zelda — Hearts, Pots & Boomerang Update

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-LÖVE2D-pink?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Legend of Zelda** for Harvard University's *CS50's Introduction to Game Development*. This project expands the top-down dungeon game from Lecture 5 with healing-heart drops, interactive pots, carrying and throwing states, and a collectable Boomerang with returning-projectile behaviour.

This implementation received a perfect score of **100%** for meeting the project's grading requirements. 🎉

- [Watch the gameplay demo](https://www.youtube.com/watch?v=NIedrSInCYw)
- [Official CS50 Games course reference](https://cs50.harvard.edu/games/)

---

## 🚀 Project Overview

The objective was to extend the dungeon engine with collectable health items and pots that function as both solid obstacles and throwable weapons. The project also includes an additional Boomerang inventory and ranged-combat system.

## 🎮 Features Implemented

- **Random Healing Hearts:** Defeated enemies have a chance to drop a heart that restores 2 health points.
- **Health Limit:** Healing is capped at the player's maximum health of 6.
- **Interactive Pots:** Pots spawn throughout the dungeon as solid objects that block player movement.
- **Pot Carrying:** A nearby pot can be lifted and carried above the player's head.
- **Carrying Animation:** The player's animation changes while carrying a pot, and sword attacks are disabled.
- **Throwable Pots:** A carried pot can be thrown in the direction the player is facing.
- **Pot Damage:** A thrown pot deals 1 point of damage when it strikes an enemy.
- **Pot Travel Limit:** Thrown pots disappear after hitting a wall or enemy, or travelling farther than four tiles.
- **Treasure Chest:** A chest placed in the dungeon unlocks the Boomerang when opened.
- **Boomerang Inventory:** The Boomerang is unavailable until collected, after which an inventory icon appears.
- **Returning Projectile:** The Boomerang travels up to four tiles before returning to the player's current position.
- **Collision Detection:** The Boomerang returns early after hitting a wall or enemy and damages enemies on contact.
- **Rotating Animation:** The Boomerang rotates while travelling through the dungeon.
- **Inventory Indicator:** The Boomerang icon changes appearance while the item is in flight.

---

## 🕹️ Controls

| Action | Control Key |
| :--- | :--- |
| Move right | `Right Arrow` |
| Move left | `Left Arrow` |
| Move up | `Up Arrow` |
| Move down | `Down Arrow` |
| Lift or throw pot | `Enter` / `Return` |
| Swing sword | `Spacebar` |
| Use Boomerang | `E` |
| View dungeon map | `M` |
| Quit game | `Escape` |

The sword cannot be used while the player is carrying a pot. The Boomerang can only be thrown after it has been collected and while it is not already in flight.

---

## ❤️ Healing Hearts

Enemies do not drop a heart every time they are defeated. When a heart appears and is collected, it:

- Restores 2 health points, representing one full heart.
- Never raises the player's health above the maximum value of 6.
- Is removed from the room after being consumed.

---

## 🏺 Pots

Pots can be used as both dungeon obstacles and weapons:

1. The player faces a nearby pot and presses `Enter` or `Return` to lift it.
2. The player enters a carrying state and holds the pot above their head.
3. The pot follows the player's position while being carried.
4. Pressing the interaction key again throws the pot in the direction the player is facing.
5. The pot disappears after hitting a wall or enemy, or after travelling farther than four tiles.

---

## 🪃 Boomerang

The Boomerang introduces a simple inventory and ranged-combat system:

1. The player opens the treasure chest to collect the Boomerang.
2. Its icon appears in the inventory display.
3. Pressing `E` throws it in the direction the player is facing.
4. It travels for up to four tiles while rotating.
5. It returns early if it hits a wall or enemy.
6. During its return journey, it tracks the player's current position, even while the player moves.
7. It cannot be thrown again until it has returned.

---

## 🛠️ Built With

- **Language:** Lua
- **Framework:** LÖVE2D
- **Architecture:** Object-oriented game entities and state machines

---

## 🧠 Core Concepts Explored

- **Finite-State Machines:** Separate player states manage idle movement, sword attacks, lifting pots and carrying pots.
- **Object Interaction:** Collidable and consumable game objects respond differently to player, wall and enemy contact.
- **Projectile Movement:** Pots and the Boomerang travel using direction-based velocity and maximum-distance checks.
- **Collision Detection:** Projectiles detect dungeon walls and enemies before applying damage or changing state.
- **Inventory State:** The Boomerang's locked, available and in-flight conditions determine when it can be used.
- **Dynamic Tracking:** A carried pot follows the player, while the returning Boomerang continually adjusts towards the player's current position.
- **Health Management:** Healing applies a fixed amount while respecting the player's maximum-health limit.

---

## 💻 Code Architecture

| File / Component | Responsibility |
| :--- | :--- |
| `src/GameObject.lua` | Represents interactive dungeon objects such as hearts, pots and the treasure chest. |
| `src/Player.lua` | Stores player health, movement data, inventory state and references to carried objects. |
| `src/states/entity/player/PlayerLiftState.lua` | Handles lifting a nearby pot and transitioning into the carrying state. |
| `src/states/entity/player/PlayerCarryState.lua` | Updates the carrying animation, keeps the pot above the player and handles throwing. |
| `src/states/entity/player/PlayerSwingSwordState.lua` | Manages sword attacks when the player is not carrying a pot. |
| `src/Room.lua` | Manages room objects, enemies, collision checks and item drops. |
| Boomerang component | Controls collection status, outward movement, rotation, collision response and return tracking. |

### Pot and Boomerang Behaviour Flow

```text
Pot:        idle -> lifted -> carried -> thrown -> removed on impact or distance limit
Boomerang:  locked -> collected -> thrown -> returning -> available again
```

---

## 🚀 How to Run the Game

This game requires the **LÖVE2D** framework.

### Prerequisites

Download and install LÖVE2D from [love2d.org](https://love2d.org/) or through your package manager.

### Running Locally

1. Clone or download the project repository.
2. Open a terminal or command prompt.
3. Navigate to the project folder:

   ```bash
   cd path/to/your/CS50/zelda
   ```

4. Run the game:

   ```bash
   love .
   ```

---

## 📚 Course Assignment

This project is based on the archived CS50 Games Zelda assignment, which required:

- Random healing-heart drops from defeated enemies.
- Full-heart healing without exceeding the health cap.
- Collidable pots that can be lifted and carried.
- A dedicated carrying animation that disables sword attacks.
- Directional pot throwing with wall, enemy and distance limits.
- One point of damage when a thrown pot hits an enemy.

CS50 Games has existed in archive form since 1 July 2024, so the project can no longer be submitted for course credit but remains available as a programming exercise.
