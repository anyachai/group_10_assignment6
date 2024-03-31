class PacMan {
  int posX;
  int posY;
  int direction;

  PacMan(int posX, int posY, int direction) {
    this.posX = posX;
    this.posY = posY;
    this.direction = direction;
  }

  void turnRight() {
    direction = (direction + 1) % 4;
  }

  void turnLeft() {
    direction = (direction - 1 + 4) % 4;
  }

  void move() {
    direction = int(random(4));
    
    // Moving the pacman around with 'wrap' around the edges
    if (direction == 0) {
      posY = (posY - 1 + grid[0].length) % grid[0].length;
    } else if (direction == 1) {
      posX = (posX + 1) % grid.length;
    } else if (direction == 2) {
      posY = (posY + 1) % grid[0].length;
    } else if (direction == 3) {
      posX = (posX - 1 + grid.length) % grid.length;
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
