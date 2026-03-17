PImage img;

int step = 7;

float amplitude = 10;
float freq = 0.02;
float speed = 0.05;

void setup() {
  size(1000, 1333);

  img = loadImage("ballon.jpg");
  img.resize(width/2, height/2);
  img.loadPixels();

  noStroke();
}

void draw() {
  background(0);
  
  rect(250, 0, 20, 1333);

  float t = frameCount * speed;

  for (int y = 0; y < img.height; y += step) {
    for (int x = 0; x < img.width; x += step) {

      color c = img.pixels[y * img.width + x];
      float b = brightness(c);

      float d = map(b, 0, 255, step, 1);
      float wave = sin(x * freq + t) * amplitude;

      circle(
        250+x + step * 0.5,
        200+y + step * 0.5 + wave,
        d
      );
    }
  }
}
