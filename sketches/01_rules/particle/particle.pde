// PARTICLE DRIVEN BY NOISE

float t = 0;
PVector pos;

void setup() {
  size(800, 600);
  pos = new PVector(width/2, height/2);
  background(0);
  stroke(0, 200, 255, 100);
}

void draw() {
  float angle = noise(pos.x * 0.005, pos.y * 0.005, t) * TWO_PI * 2;

  PVector dir = PVector.fromAngle(angle);
  dir.mult(2);

  PVector old = pos.copy();
  pos.add(dir);

  line(old.x, old.y, pos.x, pos.y);

  t += 0.01;
}
