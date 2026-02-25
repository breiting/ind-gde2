/*
  b06_mouse.pde
  Topic: Mouse interaction

  Shows:
  - mouseX
  - mouseY
  - mousePressed

  Design idea:
  The mouse becomes a live input signal.
  Position controls location.
  Press state controls size and color.
*/

void settings() {
  size(640, 480);
}

void setup() {
  textSize(14);
}

void draw() {
  background(245);

  // Base circle size
  float baseSize = 40;

  // If mouse is pressed, make circle bigger
  float circleSize = mousePressed ? 90 : baseSize;

  // Change color depending on pressed state
  if (mousePressed) {
    fill(20, 120, 255);
  } else {
    fill(30);
  }

  noStroke();
  circle(mouseX, mouseY, circleSize);

  // Debug overlay
  fill(0);
  text("mouseX: " + mouseX, 20, 30);
  text("mouseY: " + mouseY, 20, 50);
  text("mousePressed: " + mousePressed, 20, 70);

  // Crosshair lines for orientation
  stroke(0, 40);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
