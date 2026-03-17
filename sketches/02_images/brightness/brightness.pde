PImage img;
int step = 7;

void setup() {
  size(1000, 1333);
  img = loadImage("ballon.jpg");
  img.loadPixels();
  
  noStroke();
  noLoop();
  fill(0);
}

void draw() {
  background(255);

  for (int y = 0; y < img.height; y += step) {
    for (int x = 0; x < img.width; x += step) {

      // get the current pixel color
      color c = img.pixels[y * img.width + x];
      // get the brightness
      float b = brightness(c);

      // map brightness to size (darker pixel, bigger circle)
      float d = map(b, 0, 255, step, 1);
      circle(x, y, d);
    }
  }
}
