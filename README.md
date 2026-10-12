# Pong Clone

A two-player Pong clone built in Godot 4.5 with GDScript.

## Features

- Local two-player paddle controls
- The ball speeds up on every hit and serves in a random direction
- First to 5 points wins
- Start screen, victory screen, and sound effects for bounces, goals, and game over

## Controls

| Action | Player 1 | Player 2 |
|---|---|---|
| Move up | W | Up Arrow |
| Move down | S | Down Arrow |
| Start / restart | Space | Space |

## Running It

Open `project.godot` in [Godot 4.5](https://godotengine.org/) or newer and press F5.

## Project Structure

| File | Purpose |
|---|---|
| `main.gd` | Scoring, win condition, ball respawn, and game-over flow |
| `ball.gd` | Ball movement, bounce physics, and speed-up on hit |
| `Player1.gd` / `Player2.gd` | Paddle movement, clamped to the screen |
| `start.gd` | Start button that unpauses the game |
