Legend of Zelda - CS50 Games



A top-down dungeon adventure developed as part of Harvard's CS50 Introduction to Game Development course. This project extends the Lecture 5 distribution code with healing hearts, interactive pots, projectile combat, and an unlockable Boomerang.

Official Course Reference: CS50 Games

🎮 Gameplay & Features

Random Healing Hearts: Defeated enemies have a chance to drop a heart that restores one full heart, equal to 2 health points.

Health Limit: Healing is capped at the player's maximum health of 6 to prevent the heart display from overflowing.

Interactive Pots: Pots spawn throughout the dungeon and act as solid objects that the player cannot walk through.

Pot Carrying: The player can lift a nearby pot, carry it above their head and move around with it.

Carrying Animation: The player's animation changes while carrying a pot, and sword attacks are disabled while their hands are occupied.

Throwable Pots: A carried pot can be thrown in the direction the player is facing.

Pot Damage: A thrown pot deals 1 point of damage when it strikes an enemy.

Pot Travel Limit: Pots disappear when they hit a wall, collide with an enemy or travel farther than four tiles.

Treasure Chest: A chest is placed in one dungeon room and can be opened to unlock the Boomerang.

Boomerang Inventory: The Boomerang is unavailable at the start and is added to the player's inventory only after the chest is opened.

Returning Projectile: The Boomerang travels up to four tiles before returning to the player's current position.

Wall and Enemy Detection: The Boomerang returns early when it strikes a wall or enemy and damages enemies on contact.

Rotating Boomerang: The projectile rotates while moving through the air.

Inventory Indicator: A Boomerang icon appears after the item has been collected and changes appearance while the Boomerang is in flight.

🕹️ Controls

Action

Control Key

Move Up

↑

Move Down

↓

Move Left

←

Move Right

→

Swing Sword

Spacebar

Lift / Throw Pot

Enter or Return

Use Boomerang

E

View Dungeon Map

M

Quit Game

Esc

The sword cannot be used while the player is carrying a pot. The Boomerang can only be thrown after it has been collected and while it is not already in flight.

❤️ Healing Hearts

Enemies do not drop a heart every time they are defeated. When a heart does appear, collecting it:

Restores 2 health points, representing one full heart.

Never raises the player's health above the maximum value of 6.

Removes the heart object from the room after it is consumed.

🏺 Pots

Pots can be used as both dungeon obstacles and weapons:

The player faces a pot and presses Enter or Return to pick it up.

The player enters a carrying state and holds the pot above their head.

The pot follows the player's position while it is being carried.

Pressing the interaction key again throws the pot in the direction the player is facing.

The pot disappears after hitting a wall or enemy, or after travelling more than four tiles.

🪃 Boomerang

The Boomerang introduces a simple inventory and ranged-combat system:

The player finds and opens the treasure chest placed in the dungeon.

The Boomerang is added to the player's inventory and its icon appears on screen.

Pressing E throws it in the direction the player is facing.

It travels for up to four tiles while rotating.

It returns early if it hits a wall or enemy.

During its return journey, it tracks the player's position even if the player moves.

It cannot be thrown again until it has returned.

🚀 How to Run the Game

This game is built using the LÖVE2D framework and programmed in Lua.

Prerequisites

Install LÖVE2D from love2d.org.

Running Locally

Clone or download the project.

Open a terminal or command prompt and navigate to the Zelda directory:

cd path/to/zelda

Run the game with LÖVE2D:

love .

On macOS, if the love command is unavailable, run:

/Applications/love.app/Contents/MacOS/love .

You can also drag the zelda folder onto the LÖVE application.

🛠️ Technologies Used

Lua

LÖVE2D

State-machine architecture

Object-oriented game components

Git and GitHub

📁 Submission Structure

The Zelda project files must appear directly in the required CS50 submission branch and must not be placed inside an additional folder:

games50/projects/2025/x/zelda
├── dependencies
├── fonts
├── graphics
├── sounds
├── src
│   ├── DungeonMaker.lua
│   └── ...
├── README.md
├── conf.lua
├── main.lua
└── ...

The required branch is:

games50/projects/2025/x/zelda

If submit50 is installed, the project can be submitted with:

submit50 games50/projects/2025/x/zelda

🎥 Screencast Checklist

The demonstration video should:

Be no longer than 5 minutes and not be uploaded as a YouTube Short.

Begin with the edX and GitHub usernames displayed on screen.

Show random heart drops and the player collecting a heart.

Show the player picking up and carrying a pot.

Show a pot defeating an enemy and another pot disappearing after reaching its travel limit.

Show the chest being opened and the Boomerang being unlocked.

Show the Boomerang travelling, rotating, damaging an enemy and returning to the moving player.

Include timestamps in the video description for the first demonstration of each required feature.

📚 Course

Developed for CS50's Introduction to Game Development by Harvard University.
