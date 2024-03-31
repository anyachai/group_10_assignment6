class PelletArray {
  Pellet[][] oldArray = new Pellet[width / 20][height / 20];
  Pellet[][] newArray = new Pellet[width / 20][height / 20];

  PelletArray(int[] pmPos) {
    for (int i = 0; i < oldArray.length; i++) {
      for (int j = 0; j < oldArray[i].length; j++) {
        float r = random(2);
        
        if (r < 0.5) {
          // Half of the array is empty 
          oldArray[i][j] = randomPellet(i,j);
        } else {
          //while the rest is pellets and fruit
          oldArray[i][j] = null;
        }
      }
    }
  }
  
  void display() {
    for (Pellet[] i : oldArray) {
      for (Pellet j : i) {
        if (j != null) {
          j.display();
        }
      }
    }
  }
  
  void update(int[] pmPos) {
    // Count Neighbors
    for (int i = 0; i < oldArray.length; i++) {
      for (int j = 0; j < oldArray[i].length; j++) {
        int neighbors = 0;
        
        // Check the surrounding eight neighbors
        for (int h = -1; h <= 1; h++) {
          for (int k = -1; k <= 1; k++) {
            
            // Check that index is within bounds
            // and Exclude the middle cell  
            if ((i+h >= 0) && (i+h <= oldArray.length-1) && 
                (j+k >= 0) && (j+k <= oldArray[i].length-1) &&
                ((h != 0) || (k != 0))) {
                     
                  if (oldArray[i+h][j+k] != null) {
                     neighbors += 1;
                  }  
            }
          }
        }
    
        if (oldArray[i][j] != null) {
          if ((neighbors < 2) || (neighbors > 4)) {
            // Underpopulation OR Overpopulation
            newArray[i][j] = null;
          } else {
            newArray[i][j] = oldArray[i][j];
          } 
        } else {
          if (neighbors == 3) {
            // Reproduction
            newArray[i][j] = randomPellet(i,j);
          }
        }
    
      }
    }
    
    // Remove pellet where Pacman is currently at
    newArray[(pmPos[0] + oldArray.length) % oldArray.length]
    [(pmPos[0] + oldArray[0].length) % oldArray[0].length] = null;
    
    // Copy new array to old array
    for (int k = 0; k < oldArray.length; k++) {
      arrayCopy(newArray[k], oldArray[k]);
    }
    
  }
  
  Pellet randomPellet(int i, int j) {
    Pellet somePellet;
    float r = random(1);
    
    if (r < 0.85) {
      somePellet = new Pellet(i*20,j*20);
    } else if (r < 0.95) {
      somePellet = new PowerPellet(i*20,j*20);
    } else {
      somePellet = new Fruit(i*20,j*20);
    }
    
    return somePellet;
  }
}
