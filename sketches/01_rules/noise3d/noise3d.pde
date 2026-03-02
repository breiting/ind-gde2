// 3D NOISE (animated surface)

float scale = 0.02;
float t = 0;

void setup() {
  size(800, 600);
  noStroke();
  colorMode(HSB, 255);
}

void draw() {
  background(0);

  for (int x = 0; x < width; x += 10) {
    for (int y = 0; y < height; y += 10) {

      float n = noise(x * scale, y * scale, t);

      float s = n * 12;

      fill(150 + n*100, 200, 255);
      ellipse(x, y, s, s);
    }
  }

  t += 0.01;
}
