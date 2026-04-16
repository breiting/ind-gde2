float particleSize = 50;
float px, py;
float vx, vy;

void setup() {
  size(800,800);
  fill(255);
  noStroke();

  px = width/2;
  py = height/2;

  vx = 4;
  vy = 1;
}

void draw() {
  background(0);

  // Add velocity
  px = px + vx;
  py = py + vy;

  // Bounce off
  float r = particleSize /2;
  if (px <=r || px >= width-r) {
    vx = -vx;
  }
  
  if (py <=r || py >= height-r) {
    vy = -vy;
  }
  
  circle(px, py, particleSize);
}
