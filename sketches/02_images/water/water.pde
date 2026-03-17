PImage img;
float step = 7;

float waveX = 0;
float waveY = 0;
float waveAge = 9999;

float amplitude = 30;
float freq = 0.02;
float speed = 6.0;
float bandWidth = 200;

void setup() {
  size(1000, 1333);

  img = loadImage("ballon.jpg");
  img.resize(width, height);
  img.loadPixels();

  noStroke();
}

void draw() {
  background(0);

  waveAge += 1;

  float waveFront = waveAge * speed;

  for (int y = 0; y < img.height; y += step) {
    for (int x = 0; x < img.width; x += step) {

      color c = img.pixels[y * img.width + x];
      float b = brightness(c);
      float d = map(b, 0, 255, step, 1);

      float dd = dist(x, y, waveX, waveY);
      float wave = 0;

      float distFromFront = abs(dd - waveFront);

      if (distFromFront < bandWidth) {
        float influence = map(distFromFront, 0, bandWidth, 1, 0);
        wave = sin((dd - waveFront) * freq) * amplitude * influence;
      }

      fill(c);
      circle(x, y + wave, d);
    }
  }
}

void mousePressed() {
  waveX = mouseX;
  waveY = mouseY;
  waveAge = 0;
}
