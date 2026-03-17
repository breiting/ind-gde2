PImage img;

int step = 12;
float len = 10;

void setup() {
  size(1000, 1333);

  img = loadImage("ballon.jpg");
  img.resize(width, height);
  img.loadPixels();

  background(0);
  strokeWeight(2);

  for (int y = 0; y < img.height; y += step) {
    for (int x = 0; x < img.width; x += step) {

      color c = img.pixels[y * img.width + x];
      float b = brightness(c);

      // Helligkeit -> Winkel
      float angle = map(b, 0, 255, 0, TWO_PI);

      float dx = cos(angle) * len;
      float dy = sin(angle) * len;

      stroke(c);
      line(x - dx/2, y - dy/2, x + dx/2, y + dy/2);
    }
  }

  noLoop();
}

