import indbox.*;

float particleSize = 10;
float r = particleSize / 2;

PVector position;
PVector velocity;

INDbox box;
float potFiltered = 0;

// current angle
float angle = -HALF_PI; // points upwards

// max speed limit
float maxSpeed = 5;
// turn rate
float turnSpeed = 0.05;

// Simple filtering
float slew(float current, float target, float maxStep) {
  float delta = target - current;
  delta = constrain(delta, -maxStep, maxStep);
  return current + delta;
}

void setup() {
  size(800, 800);

  box = new INDbox(this);

  position = new PVector(width / 2, height / 2);
  velocity = new PVector(0, 0);

  noStroke();
  background(0);
}

void draw() {
  // Tail effect for particle
  fill(0, 20);
  rect(0, 0, width, height);

  // Get INDbox values
  box.update();
  int b1 = box.button1();
  int b2 = box.button2();
  int potRaw = box.potRaw();
  if (frameCount == 1) {
    potFiltered = potRaw;
  }
  potFiltered = slew(potFiltered, potRaw, 40);

  if (b1 == 1) {
    angle -= turnSpeed; // turn left
  }
  if (b2 == 1) {
    angle += turnSpeed; // turn right
  }

  // Get speed by using poti
  float speed = map(potFiltered, 4095, 0, 0, maxSpeed);

  // Calculate velocity with angle and speed
  velocity = PVector.fromAngle(angle);
  velocity.mult(speed);

  // Update position
  position.add(velocity);

  // Wrap around
  if (position.x < -r) {
    position.x = width + r;
  }
  if (position.x > width + r) {
    position.x = -r;
  }
  if (position.y < -r) {
    position.y = height + r;
  }
  if (position.y > height + r) {
    position.y = -r;
  }

  // Draw particle
  fill(255);
  circle(position.x, position.y, particleSize);

  // Draw direction line
  stroke(255);
  line(position.x, position.y, position.x + cos(angle) * 20, position.y + sin(angle) * 20);
  noStroke();
}
