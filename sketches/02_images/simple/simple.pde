

PImage img;

void setup() {
  size(200, 200);
  img = loadImage("plasma_small.png");
}

void draw() {
  background(255);
  image(img, 0, 0);
}
