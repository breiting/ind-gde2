

int cols = 50;
int rows = 50;
float spacing;

void setup() {
  size(700, 700);
  spacing = width / cols;
  stroke(255);
  noFill();
}

void draw() {
  background(0);
  
  float distortion = map(mouseX, 0, width, 0, 100);

  for (int x = 0; x <= cols; x++) {
    for (int y = 0; y <= rows; y++) {

      float px = x * spacing;
      float py = y * spacing;

      float offsetX = sin(frameCount * 0.05 + y * 0.3) * distortion;
      float offsetY = cos(frameCount * 0.05 + x * 0.3) * distortion;

      circle(px + offsetX, py + offsetY, 4);
    }
  }
}
