PacMan pacman;
int[][] grid;
int posX;
int posY;
int direction = 0;

void setup() {
  frameRate(5);
  size(500, 500);
  grid = new int[width / 10][height / 10];
  posX = grid.length / 2;
  posY = grid[0].length / 2;
  pacman = new PacMan(posX, posY);
  background(255);
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      grid[i][j] = 0;
    }
  }
}

void draw() {
  if (grid[posX][posY] == 0) {
    pacman.turnRight();
    grid[posX][posY] = 1; 
  } else {
    pacman.turnLeft();
    grid[posX][posY] = 0;
  }
  pacman.move();
}
