float particleSize = 5;
float r = particleSize / 2;
PVector position;
PVector velocity;
PVector acceleration;

void setup() {
  size(800, 800);
  fill(255);
  noStroke();

  position = new PVector(width / 2, height / 2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0.05, 0.1);

  background(0);
}

void draw() {
  background(0);

  // Update velocity
  velocity.add(acceleration);
  position.add(velocity);

  // X-Bounce
  if (position.x <= r || position.x >= width - r) {
    velocity.x *= -1;
    position.x = constrain(position.x, r, width - r);
  }

  // Y-Bounce
  if (position.y <= r || position.y >= height - r) {
    velocity.y *= -1;
    position.y = constrain(position.y, r, height - r);
  }

  circle(position.x, position.y, particleSize);
}
