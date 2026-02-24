int N = 80;
float freq = 0.05;
float speed = 0.0005;

void setup() {
  size(700, 700);
  noStroke();
}

void draw() {
  background(0);

  float spacing = width / (float)N;
  float t = frameCount * speed;

  for (int x = 0; x < N; x++) {
    for (int y = 0; y < N; y++) {

      float px = x * spacing;
      float py = y * spacing;

      float d = dist(px, py, width/2, height/2);

      float wave = sin(d * t);
      float size = map(wave, -1, 1, 1, 10);

      fill(255);
      circle(px, py, size);
    }
  }
}
