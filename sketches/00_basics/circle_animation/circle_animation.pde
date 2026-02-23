/*
  05_circle_animation.pde
  Topic: Drawing a simple circle with animation

  Goal:
  A circle moves left-to-right and bounces at the edges.
  This is the simplest "behavior loop":
  position += velocity; then handle boundaries.

  Try this:
  - Change speed
  - Change radius
  - Add a vertical wobble using sin(time)
*/

float x;
float speed = 3.2;
float radius = 35;

void setup() {
  size(640, 360);
  x = radius; // start inside the canvas
  noStroke();
}

void draw() {
  background(250);

  // Move
  x = x + speed;

  // Bounce at edges (simple physics idea)
  if (x > width - radius) {
    x = width - radius;
    speed = -speed;
  } else if (x < radius) {
    x = radius;
    speed = -speed;
  }

  // Optional: small vertical motion (rhythm)
  float t = millis() / 1000.0;
  float y = height * 0.5 + sin(TWO_PI * 0.6 * t) * 40;

  fill(20);
  ellipse(x, y, radius * 2, radius * 2);

  // Debug overlay
  fill(0);
  text("x: " + nf(x, 0, 1) + "  speed: " + nf(speed, 0, 1), 12, 20);
}
