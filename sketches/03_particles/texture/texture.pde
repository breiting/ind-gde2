import indbox.*;

PVector position;
PVector velocity;

INDbox box;
PShape rocket;

float potFiltered = 0;

// current angle
float angle = -HALF_PI; // starts upwards

// max speed limit
float maxSpeed = 5;
// turn rate
float turnSpeed = 0.05;

// size for drawing the rocket
float rocketScale = 0.6;

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

  // SVG from rocket.svg
  rocket = loadShape("rocket.svg");
  shapeMode(CENTER);
  noStroke();
  background(0);
}

void draw() {
  // trail effect
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

  // turn left / right
  if (b1 == 1) {
    angle -= turnSpeed;
  }
  if (b2 == 1) {
    angle += turnSpeed;
  }

  // speed from poti
  float speed = map(potFiltered, 4095, 0, 0, maxSpeed);

  // velocity from angle + speed
  velocity = PVector.fromAngle(angle);
  velocity.mult(speed);

  // update position
  position.add(velocity);

  // wrap around
  float wrapMargin = 20;

  if (position.x < -wrapMargin) {
    position.x = width + wrapMargin;
  }
  if (position.x > width + wrapMargin) {
    position.x = -wrapMargin;
  }
  if (position.y < -wrapMargin) {
    position.y = height + wrapMargin;
  }
  if (position.y > height + wrapMargin) {
    position.y = -wrapMargin;
  }

  drawRocket(position.x, position.y, angle);
}

void drawRocket(float x, float y, float a) {
  pushMatrix();
  translate(x, y); // shift coordinate system
  rotate(a + HALF_PI);
  scale(rocketScale);
  shape(rocket, 0, 0);
  popMatrix();
}
