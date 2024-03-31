class Fruit extends Pellet {
  
  Fruit(int xcor, int ycor) {
    super(xcor, ycor);
  }
  
  void display() {
    image(img_fruit, xcor, ycor, 20, 20);
  }
}
