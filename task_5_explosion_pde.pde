/* Task 5: Explosion
 * every time you click on the screen 100 balls appear
 * they move in random direction and are bounced back, therefore they never leave the frame
 * the balls will have a different diameter and speed on each click
 *
 * By: Muzna Maryam
 */

//number of balls
int n = 100;

//variables
float DIAMETER = random(5, 30);
float[] positionX;
float[] positionY;
float[] speedX;
float[] speedY;

void setup() {
  size(640, 480);
  noStroke();
  fill(121, 21, 21);

  //declaring the arrays in setup
  positionX = new float[n];
  positionY = new float[n];
  speedX = new float[n];
  speedY = new float[n];

  //screen blank in start and there is no ball at (0,0)
  for (int i = 0; i < n; i++) {
    positionX[i] = - DIAMETER;
    positionY[i] = - DIAMETER;
  }
}

void draw() {
  background(196, 194, 194);

  //all the balls
  for (int i = 0; i < n; i++) {
    circle(positionX[i], positionY[i], DIAMETER);
  }

  //speed of balls increases by speedX in X direction..the balls bounce back from vertical sides
  for (int i = 0; i < positionX.length; i++) {

    positionX[i] += speedX[i];
    if (positionX[i] < 0 || positionX[i] > width) {
      speedX[i] *= -1;
    }
  }

  //speed of balls increases by speedY in Y direction..the balls bounce back from horizontal sides
  for (int i = 0; i < positionY.length; i++) {

    positionY[i] += speedY[i];
    if (positionY[i] < 0 || positionY[i] > height) {
      speedY[i] *= -1;
    }
  }
}

void mousePressed() {
  //everytime the mouse is pressed a random diameter of balls appear
  DIAMETER = random(5, 30);

  for (int i = 0; i < n; i++) {
    //so that the explosion appears from the tip of the cursor
    positionX[i] = mouseX;
    positionY[i] = mouseY;

    //speed of balls in X and Y direction
    speedX[i] = random(-5, 5);
    speedY[i] = random(-5, 5);
  }
}

void mouseReleased() {
  save("task_5_explosion.tif");
}
