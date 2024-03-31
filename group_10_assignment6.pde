PacMan pacman;
PelletArray PelletGrid;
Ghost[] ghosts = new Ghost[5];
int[][] grid;
int posX;
int posY;
int direction = 0;
PImage img_pacman;
PImage img_ghost;
PShape img_pellet;
PShape img_power_pellet;
PImage img_fruit;
boolean paused;

void setup() {
  // Set up screen
  frameRate(4);
  size(500, 500);
  background(0);
  paused = false;
  
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
  
  // Set up image of ghost - https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b387032e-23e6-4543-bdf6-e65585c15d93/dexnpu5-3ccc2e4e-b690-4bab-bda9-cc6bdd93866c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IzODcwMzJlLTIzZTYtNDU0My1iZGY2LWU2NTU4NWMxNWQ5M1wvZGV4bnB1NS0zY2NjMmU0ZS1iNjkwLTRiYWItYmRhOS1jYzZiZGQ5Mzg2NmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xn_b3yVJz8T6ANtH7260DLclfm9XBeaawN3ZeceZzbA
  img_ghost = loadImage("ghost.png");
  
  // Creating the grid
  grid = new int[width / 20][height / 20];
  
  // Creating the characters
  pacman = new PacMan(grid.length / 2, grid[0].length / 2, direction);
  
  // Creating Pellets, Power Pellets, and Fruits
  PelletGrid = new PelletArray(pacman.position());
  
  // Setup Ghost
  for (int i = 0; i < 5; i++) {
    ghosts[i] = new Ghost(int(random(20)), int(random(20)));
  }
}

void draw() {
  if (!paused) {
    background(0);

    // Moving the Pac-Man
    pacman.move();
  
    // Displaying Pellets, Power Pellets, and Fruits
    PelletGrid.display(pacman.position());
  
    // Moving the ghost
    for (int i = 0; i < 5; i++) {
      ghosts[i].move();
    }
  }
}

void mouseReleased() {
  paused = !paused;
}
