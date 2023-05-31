/*
* Tree Variant of the Recursion Assignment
 *
 * The following two conditions are always met:
 1. There is a random chance that there are more than 2 branches
 2. One 'child' branch does not start at the tip of the 'parent' branch,
 but from the branch itself
 * In addition to these conditions two more conditions are met:
 1. The angles of the branches have a small random influence
 2. The tree follows a nice coloring
 *
 * By: Muzna Maryam
 */

// Quasi constants
float BASE_NORM_X = 0; // Coordinate system base vector
float BASE_NORM_Y = -1;
int MAX_BRANCHES = 20; // Maximum number of branches
float BRANCH_FRACTION = 2.0 / 3.0;

// Global variables
// Fraction of parent branch length that child branches have:
float newBranchFactor = 0.0;
// Angle deviation of branches. The fraction is multiplied by PI.
float angleFactor = 0.0;

// Array for additional branch decisions
boolean addBranch[];

// Color values for the tree
int[] colors = {
  color(173, 45, 45),
  color(222, 45, 45),
  color(222, 219, 51),
  color(152, 234, 59),
  color(86, 219, 187)
};

void setup() {
  size(800, 600);
  noFill();

  addBranch = new boolean[MAX_BRANCHES];
  for (int iPos = 0; iPos < addBranch.length; iPos++) {
    if (random(1.0) > 0.5) {
      addBranch[iPos] = true;
    } else {
      addBranch[iPos] = false;
    }
  }
}

void draw() {
  background(255);

  // The branch length and angle factors are computed
  // out of the mouse positions and both are restricted to
  // a meaningfull range.
  newBranchFactor = (mouseY * 4 / 5) / (float) height;
  angleFactor = mouseX / (float) width;

  // Start the recursion:
  drawBranch(width / 2, height, 0, 150, 0);
}

/*
* Recursively draw a branch.
 * Two child branches (= recursion) are created at the tip of the
 * drawn branch. They deviate from the angle of the parent branch
 * by a certain symmetric angle.
 */
void drawBranch(float startX, float startY, float angle, float
  branchLength, int numBranch) {

  // Base case: Small branch length or maximum number of branches
  //reached
  if (branchLength < 2 || numBranch >= MAX_BRANCHES) {
    return;
  }

  // we set the stroke color based on the number of branches
  // Use lerpColor() to linearly interpolate between the first and last
  //colors in the colors array
  //this line of code will create a coloring pattern
  stroke(lerpColor(colors[0], colors[colors.length - 1], (float)
    numBranch / MAX_BRANCHES));

  // Compute the normal vector for the given angle:
  float normX = BASE_NORM_X * cos(angle) - BASE_NORM_Y * sin(angle);
  float normY = BASE_NORM_X * sin(angle) + BASE_NORM_Y * cos(angle);

  // Compute the end of the branch:
  // start + vector defined by the rotated normal vector and the branch
  //length
  float endX = startX + normX * branchLength;
  float endY = startY + normY * branchLength;

  // Draw the branch
  line(startX, startY, endX, endY);

  // One 'child' branch does not start at the tip of the 'parent'
  //branch,
  // but from the branch itself (i.e. at a certain fraction of the
  //branch)
  float branchFraction = BRANCH_FRACTION;
  float tipX = lerp(startX, endX, branchFraction);
  float tipY = lerp(startY, endY, branchFraction);

  //we use the 'noise' function because
  //it generates a smooth pattern
  //the angles of the branches will vary firmly over time
  float angleNoise = noise(frameCount * 0.01) * 0.1 - 0.08;
  drawBranch(endX, endY, angle - PI * angleFactor + angleNoise, branchLength * newBranchFactor, numBranch + 1);
  drawBranch(endX, endY, angle + PI * angleFactor + angleNoise, branchLength * newBranchFactor, numBranch + 1);

  // There is a random chance that there are more than 2 branches
  if (addBranch[numBranch]) {
    drawBranch(endX, endY, angle + angleNoise, branchLength * newBranchFactor, numBranch + 1);
  }

  // Implementation of the child branches
  drawBranch(tipX, tipY, angle - PI * angleFactor + angleNoise, branchLength * newBranchFactor, numBranch + 1);
}

void mouseReleased() {
  save("task_6_recursion.tif");
}
