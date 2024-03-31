class Pellet {
  int xcor, ycor;
  
  Pellet(int xcor, int ycor) {
    this.xcor = xcor + 10;
    this.ycor = ycor + 10;
  }
  
  void display() {
    shape(img_pellet, xcor, ycor);
  }
}
