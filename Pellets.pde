class Pellets {
  int[][] new_grid = new int[grid.length][grid[0].length];
  
  void createPellets() {
    for (int i=0; i < grid.length; i++) {
      for (int j=0; j < grid.length; j++) {
        grid[i][j] = int(random(2));
      }
    }
  }
  
  void display(int[] pmLoc) {
    for (int i=0; i < grid.length; i++) {
      for (int j=0; j < grid[0].length; j++) {
        if ((grid[i][j] == 1) && !((pmLoc[0] == i) && (pmLoc[1] == j))) {
          fill(#FFFF00);
          ellipse((i+0.5) * width/grid.length,
                  (j+0.5) * height/grid[0].length,
                  8, 8);
        }
      }
    }
  }
  
  int[][] update(int[] pmLoc) {
    grid[pmLoc[0]][pmLoc[1]] = 0;
    
    for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      
      int neighbors = 0;
      
      // Check the surrounding eight neighbors
      for (int h = -1; h <= 1; h++) {
      for (int k = -1; k <= 1; k++) {
        // Check that index is within bounds
        // Exclude the middle cell
        if ((i+h >= 0) && (i+h <= grid.length-1) && 
            (j+k >= 0) && (j+k <= grid[0].length-1) &&
            ((h != 0) || (k != 0))) {
            if (grid[i+h][j+k] == 1) {
              neighbors += 1;
            }  
        }
      }
      }
      
      if (grid[i][j] == 1) {
        if (neighbors < 3) {
          // Underpopulation
          new_grid[i][j] = 0;
        } else if (neighbors > 5) {
          // Overpopulation
          new_grid[i][j] = 0;
        } else {
          // Stable population
          new_grid[i][j] = 1;
        }
      } else {
        if (neighbors == 4) {
          // Reproduction
          new_grid[i][j] = 1;
        } else {
          // Empty
          new_grid[i][j] = 0;
        }
      }
    }
    }
    return new_grid;
  }
}
