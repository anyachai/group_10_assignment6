PacMan pacman;
int[][] grid;
int posX;
int posY;
int direction = 0;
PImage img_pacman;

void setup() {
  frameRate(5);
  size(500, 500);
  background(0);
  img_pacman = loadImage("pacman.png");
  
  // Creating the grid
  grid = new int[width / 20][height /20];
  
  // Creating the characters
  pacman = new PacMan(grid.length / 2, grid[0].length / 2, direction, img_pacman);
}

void draw() {
  background(0);

  // Moving the Pac-Man
  pacman.move();
}
