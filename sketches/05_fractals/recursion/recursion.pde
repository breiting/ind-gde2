void setup() {
  size(800, 800);
  background(0);
  smooth();
  strokeWeight(1);
  noFill();
  stroke(255);
}

void drawCircle(float x, float y, float r) {
  circle(x, y, r * 2);

  if (r > 10) {
    r *= 0.7;
    drawCircle(x, y, r);
  }
}

void draw() {
  drawCircle(width / 2, height / 2, 400);
}
