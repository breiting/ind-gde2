// 1D NOISE MOVEMENT

float t = 0;

void setup() {
  size(800, 400);
  background(0);
  noStroke();
}

void draw() {
  background(0);

  float n = noise(t);          // value between 0..1
  float x = n * width;

  fill(170, 200, 255);
  circle(x, height/2, 40);

  t += 0.01;                   // slow change
}
