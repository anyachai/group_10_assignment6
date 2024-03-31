PacMan pacman;
PelletArray PelletGrid;
int[][] grid;
int posX;
int posY;
int direction = 0;
PImage img_pacman;
PShape img_pellet;
PShape img_power_pellet;
PImage img_fruit;

void setup() {
  // Set up screen
  frameRate(4);
  size(500, 500);
  background(0);
  
  // Set up image of pacman
  img_pacman = loadImage("pacman.png");
  
  // Set up image of pellet
  img_pellet = createShape(ELLIPSE, 0, 0, 9, 9);
  img_pellet.setFill(#f6cf92);
  img_pellet.setStroke(false);
  
  // Set up image of power pellet
  img_power_pellet = createShape(ELLIPSE, 0, 0, 13, 13);
  img_power_pellet.setFill(#ff775e);
  img_power_pellet.setStroke(false);
  
  // Set up image of fruit
  img_fruit = loadImage("fruit.png");
  
  // Creating the grid
  grid = new int[width / 20][height / 20];
  
  // Creating the characters
  pacman = new PacMan(grid.length / 2, grid[0].length / 2, direction);
  
  // Creating Pellets, Power Pellets, and Fruits
  PelletGrid = new PelletArray(pacman.position());
}

void draw() {
  background(0);

  // Moving the Pac-Man
  pacman.move();
  
  // Displaying Pellets, Power Pellets, and Fruits
  PelletGrid.display(pacman.position());
}
