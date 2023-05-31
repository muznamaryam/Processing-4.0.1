/* Game Name: Flip The Circle
 *
 * the rules of the game are simple:
 * avoid the balls from overlapping the cirlce
 * (due to the tranparency of balls and circles the overlapping is visible)
 *
 * "a simple game" for Programming1, Task 3
 */

ball[] balls = new ball[3];

int PositionX1 = 140;
int PositionX2 = 500;
int PositionY = 240;
int DIAMETER = 65;
boolean inPositionX = true;

void setup() {
  size(640, 480);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new ball();
  }
}

void draw() {
  background(191, 221, 240);

  fill(88, 27, 71, (255/1.3));
  noStroke();
  //the circle will be operated by mouse press
  if (inPositionX) {
    circle(PositionX1, PositionY, DIAMETER);
  } else {
    circle(PositionX2, PositionY, DIAMETER);
  }

  for (int i = 0; i < balls.length; i++) {
    //the funtions introduced in the "ball" tab are declared here
    balls[i].move();
    balls[i].display();
  }

  //when the one of the balls hits the static circle the game will be over
  println("GAME OVER");

  //if the ball does not hit the circle and the user keeps on avoiding it then score will be added
  println("SCORE");
}

void mousePressed() {
  // distance of mouse to the current position of circle
  float distance = 0;
  float distanceX = 0;
  float distanceY = mouseY - PositionY;

  if (inPositionX) {
    distanceX = mouseX - PositionX1;
  } else {
    distanceX = mouseX - PositionX2;
  }

  distance = sqrt(pow(distanceX, 2) + pow(distanceY, 2));
  if (distance < DIAMETER/2) {
    inPositionX = !inPositionX;
  }
}
