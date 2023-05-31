/*
* "Space Invaders" Game
 *
 * There are 7 aliens moving downwards
 * There is a spaceship at the bottom which move left and right when the key is pressed
 * The spaceship emmits a red laser when spacebar is pressed
 * When the laser hits an alien the alien disappears
 * If the aliens cross the spaceship then you lose the game
 *
 * By: Muzna Maryam
 */

int spaceshipX = 250; // starting x position of spaceship
int spaceshipY = 450; // starting y position of spaceship
int laserX, laserY; // starting x and y position of laser
boolean laserActive = false; // whether laser is active or not
int laserSpeed = -4; // speed at which laser moves upwards
int score = 0; // player's score
int alienX, alienY; // starting x and y position of alien
int alienSpeed = 1; // speed at which alien moves downwards
int numAliens = 7; // number of aliens on screen
int[] aliensX = new int[numAliens]; // array to store x position of each alien
int[] aliensY = new int[numAliens]; // array to store y position of each alien

void setup() {
  size(500, 500);
  noStroke();

  rectMode(CENTER);
  ellipseMode(CENTER);

  // initialize starting positions of aliens
  for (int i = 0; i < numAliens; i++) {
    aliensX[i] = 50 + i * 60; // spread aliens out horizontally
    aliensY[i] = 20; // start aliens at top of screen
  }
}

void draw() {
  background(0);

  // draw spaceship
  fill(242, 176, 176);
  rect(spaceshipX, spaceshipY, 40, 20);

  // draw laser, if it is active
  if (laserActive) {
    fill(255, 0, 0);
    ellipse(laserX, laserY, 10, 10);
    laserY += laserSpeed; // move laser upwards
    // if laser reaches top of screen, deactivate it
    if (laserY < 0) {
      laserActive = false;
    }
  }

  // draw aliens
  fill(145, 189, 224);
  for (int i = 0; i < numAliens; i++) {
    
    triangle(aliensX[i], aliensY[i]-10, aliensX[i]-10, aliensY[i]+10, aliensX[i]+10, aliensY[i]+10);
    
    aliensY[i] += alienSpeed; // move alien downwards
    
    // if alien reaches bottom of screen, player loses
    if (aliensY[i] > height) {
      println("You lose!");
      noLoop(); // game loop stop
    }
  }

  // check if any lasers hit any aliens
  for (int i = 0; i < numAliens; i++) {
    
    // calculate distance between center of laser and center of alien
    float d = dist(laserX, laserY, aliensX[i], aliensY[i]);
    
    // they have collided, if the distance is less than the sum of the radii of the laser and alien
    if (d < 10 + 10) {
      // deactivate laser and remove alien
      laserActive = false;
      aliensX[i] = -100; // move alien off screen
      aliensY[i] = -100;
      score++; // increase score
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    // activate laser and set its starting position
    laserActive = true;
    laserX = spaceshipX;
    laserY = spaceshipY;
  } else if (key == CODED) {
    if (keyCode == LEFT) {
      spaceshipX -= 15; // move spaceship to the left
    } else if (keyCode == RIGHT) {
      spaceshipX += 15; // move spaceship to the right
    }
  }
  save("task_7_game_on.tif");
}
