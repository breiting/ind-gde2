import indbox.*;

INDbox box;

boolean lastB1 = false;

void setup() {
  size(1000, 700);
  smooth();
  box = new INDbox(this);
}

void draw() {
  background(0);
  box.update();

  boolean b1 = box.button1Pressed();
  if (b1 && !lastB1) {
    randomSeed((int) random(100000));
  }
  lastB1 = b1;

  float roughness = map(box.pot(), 4095, 0, 3, 30);

  for (int layer = 0; layer < 5; layer++) {
    drawLayer(height * (0.35 + layer * 0.1), roughness * (0.5 + layer * 0.25), 8, layer);
  }

  fill(255);
  text("pot = roughness", 20, 30);
  text("button 1 = new seed", 20, 50);
}

void drawLayer(float baseY, float stepAmount, int stepX, int layer) {
  float y = baseY;

  noStroke();
  fill(255, 40 + layer * 35);

  beginShape();
  vertex(0, height);

  for (int x = 0; x <= width; x += stepX) {
    y += random(-stepAmount, stepAmount);
    y = constrain(y, 80, height - 80);
    vertex(x, y);
  }

  vertex(width, height);
  endShape(CLOSE);
}
