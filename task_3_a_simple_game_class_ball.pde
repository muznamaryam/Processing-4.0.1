class ball {
  // declaration of all the variables
  float a;
  float b;
  int Radius;
  float speedX;
  float speedY;
  float flipX;
  float flipY;

  ball() {
    a = random(width);
    b = random(height);
    Radius = 80;
    speedX = random(5);
    speedY = random(8);

    // flip so that the balls move in different direction each time,
    // they don't start off from the same position and are divided among x and y direction
    flipX = random(2);
    flipY = random(2);

    if (flipX > 1) {
      speedX = speedX * -1;
    }
    if (flipY > 1) {
      speedY = speedY * -1;
    }
  }
  // speed of the balls
  void move() {
    a = a + speedX;
    if ((a > width) || (a < 0)) {
      speedX = speedX * -1;
    }
    b = b + speedY;
    if ((b > height) || (b < 0)) {
      speedY = speedY * -1;
    }
  }
  void display() {
    fill(38, 71, 90, (255/1.1));
    ellipse(a, b, Radius, Radius);
  }
}
