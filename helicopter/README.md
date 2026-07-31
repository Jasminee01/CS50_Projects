# CS50G Project 9: Helicopter 3D — The Endless Runner Update 🚁

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with C#](https://img.shields.io/badge/Made%20with-C%23-blue?style=for-the-badge&logo=csharp)](https://learn.microsoft.com/en-us/dotnet/csharp/)
[![Engine Unity](https://img.shields.io/badge/Engine-Unity-black?style=for-the-badge&logo=unity)](https://unity.com/)

Welcome to my implementation of **Helicopter 3D** for Harvard University's *CS50's Introduction to Game Development*. This project marks the course's transition from 2D game development into 3D using C# and Unity. It extends the endless runner with rare gem collectables and corrects the shared scroll-speed behaviour when the game restarts.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

- To watch my demo, click the link: [Demo Video]()

## 🚀 Project Overview

The objective of this assignment was to become familiar with Unity's 3D workflow, add rare gems that behave similarly to coins, and ensure that the scrolling speed of the world resets correctly whenever a new game begins.

### Core Features Implemented:

* **Rare Gem Spawning:** Added gems that appear less frequently than standard coins throughout the flight path.
* **High-Value Collectables:** Each collected gem contributes the equivalent value of five coins to the player's score.
* **Automatic Collectable Movement:** Coins and gems travel from right to left using the same shared world-scroll speed as the game's obstacles.
* **Off-Screen Despawning:** Gems are removed after passing the left edge of the screen, preventing inactive objects from remaining in the scene.
* **Prefab-Based Generation:** Created a reusable gem prefab and connected it to a dedicated spawner component.
* **Shared Speed Progression:** Planes, coins, gems and skyscrapers use a common speed value that increases as the run continues.
* **Reliable Speed Reset:** Restored the shared scroll speed to its starting value when the game is restarted with the space bar.
* **3D Collision Handling:** Unity colliders and trigger events detect collectable pickups and collisions with obstacles.

---

## 🎮 Game Controls

| Key / Mouse Input | Game Action |
| :--- | :--- |
| `Spacebar` / `Left Mouse Click` | **Apply Thrust / Ascend** (Hold to fly upwards) |
| `A` / `D` or `Left` / `Right Arrow` | **Steer Horizontally** (Move left or right) |
| `Enter` / `Spacebar` | **Restart Flight** (On the Game Over screen) |
| `Escape` | **Pause / Terminate Application** |

---

## 🛠️ Built With

* **Language:** C#
* **Engine:** Unity (3D)
* **Physics:** Unity colliders, trigger events and 3D movement vectors
* **Assets:** Unity prefabs and 3D models, including the gem model from the Proto resource pack

---

## 🛠️ Core Concepts Explored

* **Unity Components:** C# behaviours are attached to GameObjects to control collectables, spawners and gameplay systems.
* **Prefab Instantiation:** Reusable gem objects are generated from a configured prefab during play.
* **Randomised Spawning:** Spawn timing and probability make gems rarer than ordinary coins.
* **Transform-Based Movement:** Collectables and obstacles move across the scene using frame-rate-independent position updates.
* **Trigger-Based Collection:** Collider trigger events identify when the helicopter collects a coin or gem.
* **Object Lifecycle Management:** Collectables are instantiated when needed and destroyed after collection or once they leave the screen.
* **Static Shared State:** A common static speed field synchronises movement across skyscrapers, aeroplanes and collectables.
* **Scene-Restart Behaviour:** The shared speed is explicitly restored because static fields retain their values when a Unity scene reloads.

---

## 💻 Code Architecture

| Script | Description |
| :--- | :--- |
| `Gem.cs` | Controls gem movement, five-coin collection value and off-screen despawning. |
| `GemSpawner.cs` | Instantiates the gem prefab at random intervals that are less frequent than coin spawns. |
| `Coin.cs` | Provides the existing collectable movement and pickup behaviour used as the basis for gems. |
| `CoinSpawner.cs` | Handles the standard coin-spawning pattern used as a reference for rare gem generation. |
| `SkyscraperSpawner.cs` | Stores the shared static scroll speed used by skyscrapers, aeroplanes and collectables. |

### The Gem Movement and Despawning System Under the Hood

This C# example shows the core behaviour used to move a gem with the shared world speed and remove it after it passes the left edge of the screen:

```csharp
private void Update()
{
    transform.position += Vector3.left
        * SkyscraperSpawner.speed
        * Time.deltaTime;

    if (transform.position.x < despawnX)
    {
        Destroy(gameObject);
    }
}
```

The gem's trigger-collision logic awards five coin points before destroying the collected GameObject. During the restart sequence, the shared `SkyscraperSpawner.speed` value is also restored before the scene begins again.
