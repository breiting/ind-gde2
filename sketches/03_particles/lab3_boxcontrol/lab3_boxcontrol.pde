import indbox.*;

INDbox box;
float potFiltered = 0;

// Simple filtering
float slew(float current, float target, float maxStep) {
  float delta = target - current;
  delta = constrain(delta, -maxStep, maxStep);
  return current + delta;
}

void setup() {
  size(800, 800);

  box = new INDbox(this);

  noStroke();
  background(0);
}

void draw() {
  // TODO: [optional] tail effect for particle

  // Get INDbox values
  box.update();
  int b1 = box.button1();
  int b2 = box.button2();
  int potRaw = box.potRaw();
  if (frameCount == 1) {
    potFiltered = potRaw;
  }
  potFiltered = slew(potFiltered, potRaw, 40);

  // TODO: use button for controling the angle
  if (b1 == 1) {}
  if (b2 == 1) {}

  // TODO: map poti to speed (between 0 and maxSpeed)

  // TODO: calculate velocity with angle and speed (use .fromAngle() and .mult())

  // TODO: update position

  // TODO: handle border (either wrap around or bounce off)

  // TODO: draw particle

  // TODO: [optional] draw direction line for stearing using cos() and sin()
}
