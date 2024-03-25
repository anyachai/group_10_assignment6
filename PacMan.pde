class PacMan{
  int posX;
  int posY;
  
  void PacMan(int posX, int posY){
    this.posX = posX;
    this.posY = posY;
  }
  
  void turnRight() {
    if (direction == 3){
      direction = 0;
    } else{
      direction += 1;
    }
  }
  
  void turnLeft() {
    if (direction == 0){
      direction = 3;
    }else{
      direction -= 1;
    }
  }
  
  void move() {
  
    if (direction == 0 && posY > 0) {
      posY--; 
    } else if (direction == 1 && posX < grid.length - 1) {
      posX++;
    } else if (direction == 2 && posY < grid[0].length - 1) {
      posY++;
    } else if (direction == 3 && posX > 0) {
      posX--;
    }
    
    if (grid[posX][posY] == 0) {
        fill(255);
    } else {
        fill(0);
    }
    rect(posX * 10, posY * 10, 10, 10);
    
  }
}
