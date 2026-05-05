float centerX = -0.743643887037151; // interessanter Bereich
float centerY =  0.131825904205330;

float zoom = 200;
float zoomSpeed = 1.02;

int baseIter = 100;

void setup() {
  size(800, 800);
  pixelDensity(1);
}

void draw() {
  loadPixels();

  // Zoom wächst kontinuierlich
  zoom *= zoomSpeed;

  // sichtbarer Bereich wird kleiner
  float scale = 3.0 / zoom;

  // Iterationen steigen mit Zoom → mehr Detail
  int maxIter = int(baseIter + log(zoom) * 30);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      float a = map(x, 0, width, centerX - scale, centerX + scale);
      float b = map(y, 0, height, centerY - scale, centerY + scale);

      float ca = a;
      float cb = b;

      int n = 0;

      while (n < maxIter) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (a * a + b * b > 4) break;

        n++;
      }

      // weicher Farbverlauf
      float bright = map(n, 0, maxIter, 0, 255);

      if (n == maxIter) {
        pixels[x + y * width] = color(0);
      } else {
        pixels[x + y * width] = color(bright, bright * 0.6, 255);
      }
    }
  }

  updatePixels();

  // Debug Overlay
  fill(255);
  text("zoom: " + nf(zoom, 1, 2), 20, 20);
  text("iter: " + maxIter, 20, 40);
}

