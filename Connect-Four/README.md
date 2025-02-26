# Connect-Four Command Line Game

Welcome to **Connect-Four!**\
This classic game is played on a 7x6 grid where two players take turns dropping their colored discs into a column. 
The discs stack from the bottom up, and the goal is to connect four of their discs in a row—either horizontally, vertically, or diagonally. 
The game ends when one player achieves this alignment, securing victory, or when the grid is completely filled, resulting in a draw if no player has won.

## Table of Contents

- [Installation](#installation)
- [How to Play](#how-to-play)
- [Features](#features)
- [Technologies](#technologies)
- [License](#license)

## Installation

### Prerequisites

- Ruby 3.x or above installed on your system.
- Clone this repository to your local machine.

### Setup Instructions

1. Clone the repository and:
    ```bash
   cd Connect-Four
   ```
2. Run the game:
   ```bash
   ruby main.rb
   ```

## How to Play
1. Run the game using the command `ruby main.rb`.
2. Player 1 will be assigned the disc 🔴 and Player 2 will be assigned the disc 🔵.
3. Players will take turns to place their disc on the board by inputing the disered column.
4. The game board is represented as follows:\
   ⚪⚪⚪⚪⚪⚪⚪\
   ⚪⚪⚪⚪⚪⚪⚪\
   ⚪⚪⚪⚪⚪⚪⚪\
   ⚪⚪⚪🔴⚪⚪⚪\
   ⚪⚪🔵🔵🔴🔵⚪\
   ⚪⚪🔵🔴🔴🔴⚪
5. After the game ends, the winner will be displayed and will be prompted for a restart. 

## Features

- Two-player game.
- Board display.
- Detects wins (horizontal, vertical, diagonal).
- Detects ties.
- Prevents players from choosing an occupied cell.

## Technologies

- **Ruby**: The game logic is written in Ruby.

### Code Structure:
- board.rb: Defines the Board class, which handles the game board logic, including checking for a winner and drawing the board.

- game.rb: Defines the Game class, which manages the game flow, including player turns, move validation winning conditions.

- player.rb: Defines the Player class, which only stores the corresponding player color.

- main.rb: Entry point of the application. It starts the game by initializing and running an instance of the Game class.

## License

This project is open-source and available under the [MIT License](https://github.com/T-MSD/Learning-Projects/blob/main/LICENSE).