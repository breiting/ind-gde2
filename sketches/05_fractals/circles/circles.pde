import indbox.*;

INDbox box;

float maxValue;

void setup() {
  size(800, 800);
  background(0);
  smooth();
  box = new INDbox(this);
  box.sendCommand("DIST_OFF");
  noFill();
  stroke(255);
}

void drawCircle(float x, float y, float r) {
  circle(x, y, r * 2);

  if (r > maxValue) {
    drawCircle(x + r / 2, y, r / 2);
    drawCircle(x - r / 2, y, r / 2);
    drawCircle(x, y + r / 2, r / 2);
    drawCircle(x, y - r / 2, r / 2);
  }
}

void draw() {
  background(0);
  box.update();

  maxValue = map(box.pot(), 4095, 0, 10, 400);

  drawCircle(width / 2, height / 2, 400);
}
