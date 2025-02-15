# 🚀 **Top-Down Game** using **Love2D** 🎮

This project is a **simple top-down game** developed using the **Love2D** framework in **Lua**. The game features a controllable player character that can move around a static background. 

---

## 🛠️ **Features**

- **Player Movement**: 
  - Move the player in four directions (`W`, `A`, `S`, `D`).
- **Character Animations**: 
  - Animations for all movement directions (Up, Down, Left, Right).
- **Camera**: 
  - The camera follows the player’s movement, keeping the player centered on the screen.
- **Static Background**: 
  - Replaces the map with a static background image.
- **Sprite Handling**: 
  - Player sprite handled with the `anim8` library for smooth animations.

---

## 📦 **Installation**

### Requirements: 

- **Love2D** - [Install Love2D here!](https://love2d.org/)

### Run the Game:

1. Clone or download the project files.
2. Open the project folder.
3. Drag and drop the folder onto the **Love2D** application, or run the following command in your terminal:

    ```bash
    love .
    ```

---

## 🗂️ **Project Structure**

- **`libraries/`**: External libraries (e.g., `camera`, `anim8`).
- **`maps/`**: (Currently unused in the project).
- **`sprites/`**: Contains the player sprite image.
- **`images/`**: Contains the background image.
- **`main.lua`**: The main file that runs the game.

---

## 🎮 **Gameplay**

- Use **`W`, `A`, `S`, `D`** to move the player in the top-down view.
- The camera tracks the player’s movement.
- Static background throughout the gameplay.

---

## 🔮 **Future Updates**

- Add more levels/maps.
- Additional animations (e.g., jumping, attacking).
- Improve the UI with menus or settings.

---

## ⚠️ **Notes**

- Ensure that your image files (background and sprite) are placed in the correct directories.

---

## 💬 **Contribute**:

Feel free to open issues or create pull requests to improve this project. Contributions are welcome!

---

## 📢 **Credits**

- **Love2D** for the game framework.
- **anim8** for smooth animation handling.

