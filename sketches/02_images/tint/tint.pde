

PImage img;

void setup() {
  size(1000, 1333);
  img = loadImage("ballon.jpg");
  noStroke();
  fill(255);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(0);
  text("Flying ballon", width/2, height-30);
  float transparency = map(mouseY, 0, height, 0, 255);
  tint(255, transparency);
  image(img, 0, 0);
}
