/*
 * Morning Sketch Letter Board
 *
 * a sun is drawn using ellipse and a bunch of buildings are drawn
 * the sun moves from left-right and vice versa
 *
 * on top of the purple building there is a typing option
 * press the key and it will appear in dark blue color
 *
 * Animation for Programming 1, Task 2
 */

int x = 45;
int dx = 1;

void setup() {
  size(640, 480);
  textSize(50);
}

void draw() {
  background(143, 184, 240);
  noStroke();

  //press the letters and they will appear on co-ordinates (345, 250)
  fill(13, 26, 90);
  text(key, 345, 250);

  //all the buildings
  rectMode(CORNERS);
  fill(131, 70, 100);
  rect(0, 120, 110, 480);
  fill(201, 152, 176);
  rect(110, 180, 200, 480);
  fill(107, 80, 152);
  rect(320, 280, 400, 480);
  fill(131, 70, 100);
  rect(520, 160, 640, 480);

  fill(70, 20, 44);
  quad(200, 210, 320, 100, 320, 480, 200, 480);
  fill(70, 20, 44);
  quad(400, 100, 520, 210, 520, 480, 400, 480);

  saveFrame("task_2_animation_2.tif");

  //the ellipse = sun
  fill(170, 76, 21);
  ellipse(x, 45, 50, 50);
  x = x + dx;
  if (x > width) {
    dx = -1;
  }
  if (x < 0) {
    dx = 1;
  }
  saveFrame("task_2_animation_1.tif");
}

  
