class Ghost {
  int xPos;
  int yPos;
  
  Ghost (int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void move() {
    
    // List of available directions --> {N, E, S, W}
    boolean[] availableDirections = {true, true, true, true};
    int[] distToPac = {999, 999, 999, 999};
    
    // Check to see if ghost is at an edge. If at an edge, make this direction ineligable
    if (xPos == 0) {
      availableDirections[3] = false;
    }
    if (xPos == grid.length - 1) {
      availableDirections[1] = false;
    }
    if (yPos == 0) {
      availableDirections[0] = false;
    }
    if (yPos == grid[0].length - 1) {
      availableDirections[2] = false;
    }
    
    // Check to see if pellets next to ghost
    if (xPos != 0) {
      if (PelletGrid.oldArray[xPos - 1][yPos] == null) {
        availableDirections[3] = false;
      }
    }
    if (xPos != grid.length - 1) {
      if (PelletGrid.oldArray[xPos + 1][yPos] == null) {
        availableDirections[1] = false;
      }
    }
    if (yPos != 0) {
      if (PelletGrid.oldArray[xPos][yPos - 1] == null) {
        availableDirections[0] = false;
      }
    }
    if (yPos != grid[0].length - 1) {
      if (PelletGrid.oldArray[xPos][yPos + 1] == null) {
        availableDirections[2] = false;
      }
    }
    
    // Calculate distance to pacman
    PVector distToPacVect = new PVector(pacman.posX - xPos, pacman.posY - yPos);
    if ((distToPacVect.x > -1)) {
      distToPac[1] = int(distToPacVect.x);
    } else {
      distToPac[3] = int(-1 * distToPacVect.x);
    }
    if ((distToPacVect.y > -1)) {
      distToPac[2] = int(distToPacVect.y);
    } else {
      distToPac[0] = int(-1 * distToPacVect.y);
    }
    
    // Check to see if any available directions
    boolean move = false;
    for (boolean r : availableDirections) {
      move = (move | r);
    }
    
    // If available directions, move
    while (move) {
      
      // Find the direction in which the ghost is closest to pacman
      int pacIndex = minInArray(distToPac);
      
      // If pacman is close enough and there is a pellet in that direction, pacman will move in that direction
      // Or, if pacman is right next to the ghost, if there is no pellet the ghost can move in that direction
      if (((distToPac[pacIndex] < 15) & (availableDirections[pacIndex])) | (distToPac[pacIndex] < 2)) {
        if (pacIndex == 0) {
          yPos = yPos - 1;
          break;
        }
        if (pacIndex == 1) {
          xPos = xPos + 1;
          break;
        }
        if (pacIndex == 2) {
          yPos = yPos + 1;
          break;
        }
        if (pacIndex == 3) {
          xPos = xPos - 1;
          break;
        }
      }
      
      // Pic a random direction, if available move in that direction. If not, rise and repeat
      int val = int(random(4));
      if (availableDirections[val]) {
        if (val == 0) {
          yPos = yPos - 1;
          break;
        }
        if (val == 1) {
          xPos = xPos + 1;
          break;
        }
        if (val == 2) {
          yPos = yPos + 1;
          break;
        }
        if (val == 3) {
          xPos = xPos - 1;
          break;
        }
      }
    }
    display();
  }
  
  // Return the index for the smallest value in an array that is greater than zero
  int minInArray(int[] intArray) {
    int min = 0;
    int currentMin = 9999;
    for (int i = 0; i < intArray.length; i++) {
      if ((intArray[i] < currentMin) & (intArray[i] != 0))  {
        currentMin = intArray[i];
        min = i;
      }
    }
    return min;
  }
  
  void display() {
    pushMatrix();
    translate(xPos * 20 + 10, yPos * 20 + 10);
    imageMode(CENTER);
    image(img_ghost, 0, 0, 20, 20);
    popMatrix();
  }

}
