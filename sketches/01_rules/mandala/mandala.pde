

float radius = 200;  // size

void setup() {
  size(600, 600);
  background(255);

  stroke(255);
  noFill();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float petals = map(mouseX, 0, width, 1, 20);

  beginShape();
  for (float a = 0; a < TWO_PI; a += 0.01) {
    
    float r = radius * sin(petals * a);
    
    float x = r * cos(a);
    float y = r * sin(a);
    
    vertex(x, y);
  }
  endShape(CLOSE);
}
