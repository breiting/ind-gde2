float particleSize = 4;
PVector position;
PVector velocity;

float zoff = 0;

void setup() {
  size(800, 800);
  background(0);
  noStroke();

  position = new PVector(width / 2, height / 2);
  velocity = new PVector(0, 0);
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);

  float angle = noise(position.x * 0.005, position.y * 0.005, zoff) * TWO_PI * 4.0;
  PVector force = PVector.fromAngle(angle);
  force.mult(0.15);

  velocity.add(force);
  velocity.limit(2.5);
  position.add(velocity);

  if (position.x < 0) position.x = width;
  if (position.x > width) position.x = 0;
  if (position.y < 0) position.y = height;
  if (position.y > height) position.y = 0;

  fill(255, 120);
  circle(position.x, position.y, particleSize);

  zoff += 0.003;
}
