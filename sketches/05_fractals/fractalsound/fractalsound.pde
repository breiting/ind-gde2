float angle = radians(30); // degrees
float len = 200;
float scale = 0.7;

void setup() {
  size(800, 800);
  stroke(255);
  noFill();
}

void branch(float len, float depth) {
  if (depth <= 0) {
    return;
  }

  strokeWeight(depth);

  line(0, 0, 0, -len);

  // set point
  translate(0, -len);

  pushMatrix();
  rotate(angle);
  branch(len*scale, depth-1);
  popMatrix();

  pushMatrix();
  rotate(-angle);
  branch(len*scale, depth-1);
  popMatrix();
}


void draw() {
  background(0);
  
  angle = map(mouseX, 0, width, radians(0), radians(180));
  float depth = map(mouseY, 0, height, 1, 10);

  // define starting point
  translate(width/2, height-80);
  branch(180, depth);
}
