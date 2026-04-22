import indbox.*;

int maxDepth = 8;
float angle = PI / 5.0;
float scaleFactor = 0.7;

INDbox box;
float deadband = 12; // try: 5..25
float dialStable = 0;

void setup() {
  size(900, 900);
  // smooth();
  box = new INDbox(this);
  box.sendCommand("DIST_OFF");
}

void draw() {
  background(255);
  stroke(0);

  translate(width / 2, height - 80);

  box.update();

  if (box.button1Pressed()) {
    maxDepth -= 1;
  }

  if (box.button2Pressed()) {
    maxDepth += 1;
  }
  maxDepth = constrain(maxDepth, 0, 12);

  float dial = box.pot();

  // deadband: only accept larger changes
  if (abs(dial - dialStable) > deadband) {
    dialStable = dial;
  }

  float val = map(dialStable, 4095, 0, 0, 180);
  angle = radians(val);

  branch(160, maxDepth);
}

void branch(float len, int depth) {
  strokeWeight(depth);
  line(0, 0, 0, -len);
  translate(0, -len);

  if (depth <= 0) {
    return;
  }

  pushMatrix();
  rotate(angle);
  branch(len * scaleFactor, depth - 1);
  popMatrix();

  pushMatrix();
  rotate(-angle);
  branch(len * scaleFactor, depth - 1);
  popMatrix();
}
