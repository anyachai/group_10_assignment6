class PacMan {
  int posX;
  int posY;
  int direction;

  PacMan(int posX, int posY, int direction) {
    this.posX = posX;
    this.posY = posY;
    this.direction = direction;
  }

  void move() {
    // Check squares in each direction, moves based on 2 rules: if fruit is near move toward, if ghost is near move away
    boolean pelletFound = false;
    if (posX != 0 && direction == 3) { // Check left
        if (PelletGrid.oldArray[posX - 1][posY] != null) {
            posX = posX - 1;
            pelletFound = true;
        }
        for (Ghost ghost : ghosts) {
            if (ghost.xPos == posX - 1) {
                posX = constrain(posX + 1, 0, 500);
            }
        }
    }
    if (posX != grid.length - 1 && direction == 1 && !pelletFound) { // Check right
      if (posX + 1 < grid.length && PelletGrid.oldArray[posX + 1][posY] != null) {
        posX = posX + 1;
        pelletFound = true;
      }
      for (Ghost ghost : ghosts){
        if (ghost.xPos == posX + 1){
          posX = constrain(posX - 1,0,500);
        }
      }
    }
    if (posY != 0 && direction == 0 && !pelletFound) { // Check up
      if (PelletGrid.oldArray[posX][posY - 1] != null) {
        posY = posY - 1;
        pelletFound = true;
      }
      for (Ghost ghost : ghosts){
        if (ghost.yPos == posY - 1){
          posY = constrain(posY + 1, 0, 500);
        }
      }
    }
    if (posY != grid[0].length - 1 && direction == 2 && !pelletFound) { // Check down
      if (PelletGrid.oldArray[posX][posY + 1] != null) {
        posY= posY + 1;
        pelletFound = true;
      }
      for (Ghost ghost : ghosts){
        if (ghost.yPos == posY + 1){
          posY = constrain(posY - 1, 0, 500);
        }
      }
    }

    // Update direction if a pellet is not found
    if (!pelletFound) {
        // Update direction here
        direction = int(random(4));

        // Moving the pacman around with 'wrap' around the edges
        if (direction == 0) { // Up
            posY = (posY - 1 + grid[0].length) % grid[0].length;
        } else if (direction == 1) { // Right
            posX = (posX + 1) % grid.length;
        } else if (direction == 2) { // Down
            posY = (posY + 1) % grid[0].length;
        } else if (direction == 3) { // Left
            posX = (posX - 1 + grid.length) % grid.length;
        }
    }

    // Rotating the pacman based on direction
    pushMatrix();
    translate((posX + 0.5) * 20, (posY + 0.5) * 20);
    if (direction == 0) {
        rotate(HALF_PI);
    } else if (direction == 1) {
        rotate(PI);
    } else if (direction == 2) {
        rotate(-HALF_PI);
    }
    imageMode(CENTER);
    image(img_pacman, 0, 0, 20, 20);
    popMatrix();
}

  
  int[] position() {
    return new int[] {posX, posY};
  }
}
