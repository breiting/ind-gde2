/*
  01_variables.pde
  Topic: Variables

  Idea (design-first):
  Variables are "handles" you can tweak to change a visual system.
  Here: position, size, and color are controlled by variables.

  Try this:
  - Change circleSize
  - Change circleX / circleY
  - Change the background color
*/

float circleX = 220;
float circleY = 180;
float circleSize = 120;

int bgGray = 245;       // background brightness (0..255)
int circleGray = 30;    // circle brightness (0..255)

void setup() {
  size(640, 360);
  noStroke();
}

void draw() {
  background(bgGray);

  fill(circleGray);
  ellipse(circleX, circleY, circleSize, circleSize);

  // Debug overlay: show current values
  fill(0);
  text("circleX: " + circleX, 10, 20);
  text("circleY: " + circleY, 10, 40);
  text("circleSize: " + circleSize, 10, 60);
}
