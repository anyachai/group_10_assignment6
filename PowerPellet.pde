class PowerPellet extends Pellet {
  
  PowerPellet(int xcor, int ycor) {
    super(xcor, ycor);
  }
  
  void display() {
    shape(img_power_pellet, xcor, ycor);
  }
}
