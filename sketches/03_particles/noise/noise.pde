float particleSize = 5;
float r = particleSize / 2;

PVector position;
PVector velocity;
PVector acceleration;

// Used for perlin noise input
float tx = 0;
float ty = 1000;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
  fill(255, 180);

  position = new PVector(width / 2, height / 2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
}

void draw() {
  // Tail effect for particle
  fill(0, 20);
  rect(0, 0, width, height);

  float ax = map(noise(tx), 0, 1, -0.5, 0.5);
  float ay = map(noise(ty), 0, 1, -0.5, 0.5);

  acceleration.set(ax, ay);

  velocity.add(acceleration);
  velocity.limit(3.0); // limit speed
  position.add(velocity);

  // Bounce
  if (position.x <= r || position.x >= width - r) {
    velocity.x *= -1;
    position.x = constrain(position.x, r, width - r);
  }

  if (position.y <= r || position.y >= height - r) {
    velocity.y *= -1;
    position.y = constrain(position.y, r, height - r);
  }

  fill(255);
  circle(position.x, position.y, particleSize);

  tx += 0.01;
  ty += 0.01;
}
