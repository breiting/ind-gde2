float particleSize = 5;
float px, py;
float vx, vy;
float ax, ay;

void setup() {
  size(800,800);
  fill(255);
  noStroke();

  px = width/2;
  py = height/2;

  vx = 0;
  vy = 0;

  ax = 0.05;
  ay = 0.1;
  background(0);

}

void draw() {
  // Update velocity
  vx = vx + ax;
  vy = vy + ay;

  // Update position
  px = px + vx;
  py = py + vy;

  // Bounce off
  float r = particleSize /2;
  if (px <=r || px >= width-r) {
    vx = -vx;
    ax = -ax;
  }

  if (py <=r || py >= height-r) {
    vy = -vy;
    ay = -ay;
  }
  
  circle(px, py, particleSize);
}
