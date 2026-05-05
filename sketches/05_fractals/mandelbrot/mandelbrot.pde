int maxIter = 100;

void setup() {
  size(1000, 1000);
  // pixelDensity(1);
  noLoop();
}

void draw() {
  loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      // Pixel → komplexe Ebene mappen
      float a = map(x, 0, width, -2.5, 1);
      float b = map(y, 0, height, -1.5, 1.5);

      float ca = a;
      float cb = b;

      int n = 0;

      while (n < maxIter) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (a * a + b * b > 4) {
          break;
        }

        n++;
      }

      // Farbe basierend auf Iterationen
      float bright = map(n, 0, maxIter, 0, 255);

      if (n == maxIter) {
        bright = 0; // inside set = schwarz
      }

      pixels[x + y * width] = color(bright);
    }
  }

  updatePixels();
}
