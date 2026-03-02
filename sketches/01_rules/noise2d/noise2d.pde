// NOISE WAVE

float t = 0;

void setup() {
  size(800, 400);
  stroke(0, 200, 255);
  noFill();
}

void draw() {
  background(0);

  beginShape();
  for (int x = 0; x < width; x++) {
    float n = noise(x * 0.01, t);
    float y = height/2 + (n - 0.5) * 200;
    vertex(x, y);
  }
  endShape();

  t += 0.01;
}

