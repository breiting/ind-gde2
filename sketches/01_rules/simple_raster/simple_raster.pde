int cols = 10;
int rows = 10;
float spacing;

void setup() {
  size(700, 700);
  spacing = width / cols;
  stroke(255);
  noFill();
}

void draw() {
  background(0);
  
  for (int x = 0; x <= cols; x++) {
    for (int y = 0; y <= rows; y++) {

      float px = x * spacing;
      float py = y * spacing;

      circle(px, py, 4);
    }
  }
}



