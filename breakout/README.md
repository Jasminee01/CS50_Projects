# CS50G Project 6: Angry Birds — The Destruction Update 🐦

![Grade](https://img.shields.io/badge/Grade-100%25-brightgreen?style=for-the-badge)
[![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=for-the-badge&logo=lua)](https://www.lua.org/)
[![Framework LÖVE2D](https://img.shields.io/badge/Framework-L%C3%96VE2D-ea316e?style=for-the-badge&logo=love)](https://love2d.org/)

Welcome to my implementation of **Angry Birds** for Harvard University's *CS50's Introduction to 2D Game Development*. This project builds on the 2D rigid-body physics engine introduced in Lecture 6 by adding mid-flight Alien splitting, varied obstacle materials, progressive structural damage and a Box2D joint.

This codebase received a perfect score of **100%** on grading evaluation! 🎉

- To watch my demo, click the link: [https://www.youtube.com/watch?v=lU3GB7ng0ZE&t=1s]()

## 🚀 Project Overview

The objective of this assignment was to extend the supplied physics-based game with a split-Alien ability, destructible glass, wood and metal obstacles, visible damage stages and at least one joint connecting obstacles in the level.

### Core Features Implemented:

* **Mid-Flight Alien Splitting:** Pressing the space bar after launch splits the player Alien into three projectiles, provided it has not collided with anything.
* **Velocity-Based Split Trajectories:** Two additional Aliens are spawned above and below the original Alien with offset linear velocities, creating three diverging flight paths.
* **Multi-Alien Launch Tracking:** The launch marker waits until all launched Aliens have slowed to nearly a stop before resetting.
* **Slingshot Launching:** A drag-and-release launch system applies force to the player Alien based on the aiming direction.
* **Camera Tracking:** The camera follows launched projectiles across the level so that impacts and structural collapses remain visible.
* **Varied Obstacle Materials:** Wood, glass and metal obstacles use distinct textures and material behaviour.
* **Material-Based Durability:** Glass breaks after one damaging hit, wood after two and metal after three.
* **Visible Crack Progression:** Wood and metal obstacles display increasingly cracked sprites as they take damage.
* **Velocity-Gated Damage:** A collision only counts as a hit when its impact velocity reaches the required damage threshold.
* **Glass Ground Damage:** Glass is sensitive to contact and breaks when it strikes the ground.
* **Box2D Joint:** At least one joint connects obstacles in the level to create an additional physics-based structure.

---

## 🎮 Game Controls

| Key / Mouse Input | Game Action |
| :--- | :--- |
| `Left Mouse Drag` | **Aim the Slingshot** (Click the Alien and pull backwards) |
| `Release Left Mouse` | **Launch the Alien** into the playfield |
| `Spacebar` | **Trigger the Split-Alien Ability** (Before the Alien hits anything) |
| `R` | **Reset the Level** |
| `Escape` | **Terminate the Application** |

---

## 🛠️ Built With

* **Language:** Lua
* **Framework:** LÖVE2D
* **Physics Engine:** Box2D through `love.physics`
* **Assets:** Wood, glass and metal obstacle sprites with visible crack stages

---

## 🛠️ Core Concepts Explored

* **Rigid-Body Physics:** Bodies, fixtures, collision responses, gravity and linear velocity using `love.physics`.
* **Collision Callbacks:** `World:setCallbacks()` detects impacts and prevents Alien splitting after the first collision.
* **Projectile Duplication:** New Aliens inherit the original projectile's movement while receiving vertical velocity offsets.
* **Camera Movement:** Camera positioning follows active projectiles across a wider physics level.
* **State and Flag Management:** Collision and split flags ensure that the special ability can only be used once and only before impact.
* **Material-Based Damage:** Obstacle health and crack stages vary according to the selected material.
* **Fixture User Data:** Collision fixtures store an obstacle type and entity reference so callbacks can damage the correct object.
* **Box2D Joints:** Physics joints connect bodies while allowing controlled movement between obstacles.

---

## 💻 Code Architecture

| File | Description |
| :--- | :--- |
| `src/AlienLaunchMarker.lua` | Handles aiming, launching and the initial player Alien used by the split mechanic. |
| `src/Level.lua` | Manages collision callbacks, Alien splitting conditions, obstacle placement and launch-reset checks. |
| `src/Obstacle.lua` | Stores each obstacle's material, health, crack stage and fixture data. |

### The Material Damage System Under the Hood

The fixture stores both the collision type and a reference to the obstacle. This allows the level's collision callback to update the specific object that was struck:

```lua
self.fixture:setUserData({
    type = 'Obstacle',
    entity = self
})
```

The referenced obstacle can then apply its own material-specific damage rules, including the correct number of hits and visible crack stage before destruction.