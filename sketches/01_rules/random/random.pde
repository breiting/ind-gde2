// RANDOM JITTER

float x;

void setup() {
  size(800, 400);
  background(0);
  noStroke();
}

void draw() {
  background(0);

  x = random(width);

  fill(0, 200, 255);
  circle(x, height/2, 40);
}

