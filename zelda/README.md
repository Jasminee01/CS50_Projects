# Legend Of Zelda - CS50 Games

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)

A 2D remake of the mobile hit **Legend Of Zelda**, developed as part of Harvard's CS50 Introduction to Game Development course. **This implementation received a perfect score of 100%** for meeting all core grading criteria, including infinite procedural obstacle generation, state management, and seamless parallax background scrolling.

Official Course Reference: [CS50 Games](https://cs50.harvard.edu/games/)

---

## 🎮 Gameplay & Features

- **Random Healing Hearts:**  Defeated enemies have a chance to drop a heart that restores one full heart, equal to 2 health points.
- **Health Limit:**  Healing is capped at the player's maximum health of 6 to prevent the heart display from overflowing.
- **Interactive Pots:** Pots spawn throughout the dungeon and act as solid objects that the player cannot walk through.
- **Pot Carrying: ** The player can lift a nearby pot, carry it above their head and move around with it.
- **Carrying Animation:** The player's animation changes while carrying a pot, and sword attacks are disabled while their hands are occupied.
- **Throwable Pots:** A carried pot can be thrown in the direction the player is facing.
- **Pot Damage:** A thrown pot deals 1 point of damage when it strikes an enemy.
- **Pot Travel Limit** Pots disappear when they hit a wall, collide with an enemy or travel farther than four tiles.
- **Treasure Chest: **A chest is placed in one dungeon room and can be opened to unlock the Boomerang.
- **Boomerang Inventory:** The Boomerang is unavailable at the start and is added to the player's inventory only after the chest is opened.
- **Returning Projectile:** The Boomerang travels up to four tiles before returning to the player's current position.
- **Wall and Enemy Detection:** The Boomerang returns early when it strikes a wall or enemy and damages enemies on contact.
- **Rotating Boomerang:** The projectile rotates while moving through the air.
- **Inventory Indicator:** A Boomerang icon appears after the item has been collected and changes appearance while the Boomerang is in flight.


---

## 🕹️ Controls

Take control of the bird using your keyboard:

| Action | Control Key |
| :--- | :--- |
| **Move Right** | `→` |
| **Move Left** | `←` |
| **Move Up** | `↑` |
| **Move Down** | `↓` |
| **Lift / Throw Pot** | `Enter` |
| **Swing Sword** | `Spacebar` |
| **Use Boomerang** | `E` |
| **Quit Game** | `ESC` |
| **View Dungeon Map** | `M` |

The sword cannot be used while the player is carrying a pot. The Boomerang can only be thrown after it has been collected and while it is not already in flight.
---


##❤️ Healing Hearts
- Enemies do not drop a heart every time they are defeated. When a heart does appear, collecting it:
- Restores 2 health points, representing one full heart.
- Never raises the player's health above the maximum value of 6.
- Removes the heart object from the room after it is consumed.

##🏺 Pots

- Pots can be used as both dungeon obstacles and weapons:

- The player faces a pot and presses Enter or Return to pick it up.

- The player enters a carrying state and holds the pot above their head.

- The pot follows the player's position while it is being carried.

- Pressing the interaction key again throws the pot in the direction the player is facing.

- The pot disappears after hitting a wall or enemy, or after travelling more than four tiles.

##🪃 Boomerang

- The Boomerang introduces a simple inventory and ranged-combat system:

- The player finds and opens the treasure chest placed in the dungeon.

- The Boomerang is added to the player's inventory and its icon appears on screen.

- Pressing E throws it in the direction the player is facing.

- It travels for up to four tiles while rotating.
- It returns early if it hits a wall or enemy.

- During its return journey, it tracks the player's position even if the playe moves.

- It cannot be thrown again until it has returned.

## 🚀 How to Run the Game

This game is built using the **LÖVE2D** framework and programmed in **Lua**.

### Prerequisites
Make sure you have LÖVE2D installed on your system:
- Download it from [love2d.org](https://love2d.org/) or install it via your package manager.

### Running Locally
1. Open your terminal or command prompt and navigate to this specific folder:
   ```bash
   cd path/to/your/CS50/FlappyBird
