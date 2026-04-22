import indbox.*;

INDbox box;

int depth = 0;
int maxDepth = 8;

boolean splitVertical = true;

// damit ein Button-Klick nur einmal zählt
boolean lastButton1 = false;
boolean lastButton2 = false;

void setup() {
  size(900, 900);
  smooth();

  box = new INDbox(this);

  rectMode(CORNER);
  stroke(0);
  strokeWeight(6);
}

void draw() {
  background(245);

  box.update();

  handleInput();

  float margin = 60;
  float x = margin;
  float y = margin;
  float w = width - 2 * margin;
  float h = height - 2 * margin;

  splitRect(x, y, w, h, depth);

  drawHUD();
}

void handleInput() {
  boolean b1 = box.button1Pressed();
  boolean b2 = box.button2Pressed();

  // Button 1: Richtung umschalten
  if (b1 && !lastButton1) {
    splitVertical = !splitVertical;
  }

  // Button 2: Tiefe erhöhen
  if (b2 && !lastButton2) {
    depth++;
    if (depth > maxDepth) {
      depth = 0;
    }
  }

  lastButton1 = b1;
  lastButton2 = b2;
}

void splitRect(float x, float y, float w, float h, int depthLeft) {
  float minSize = 70;

  // Base case
  if (depthLeft <= 0 || w < minSize || h < minSize) {
    fillRectStyle(x, y, w, h);
    rect(x, y, w, h);
    return;
  }

  // Poti sauber einschränken, damit keine ultradünnen Rechtecke entstehen
  float t = constrain(box.pot(), 0.28, 0.72);

  if (splitVertical) {
    float w1 = w * t;
    float w2 = w - w1;

    splitRect(x, y, w1, h, depthLeft - 1);
    splitRect(x + w1, y, w2, h, depthLeft - 1);

  } else {
    float h1 = h * t;
    float h2 = h - h1;

    splitRect(x, y, w, h1, depthLeft - 1);
    splitRect(x, y + h1, w, h2, depthLeft - 1);
  }
}

void fillRectStyle(float x, float y, float w, float h) {
  // Einfache, Mondrian-artige Farbwahl
  // nicht komplett zufällig pro Frame, sondern stabil aus Position/Größe berechnet
  int c = pickColor(x, y, w, h);
  fill(c);
}

int pickColor(float x, float y, float w, float h) {
  float n = (x * 0.013 + y * 0.021 + w * 0.017 + h * 0.019) % 1.0;

  if (n < 0.65) return color(250); // weiß
  else if (n < 0.77) return color(220, 40, 30); // rot
  else if (n < 0.88) return color(30, 80, 200); // blau
  else return color(240, 200, 40); // gelb
}

void drawHUD() {
  fill(0, 160);
  noStroke();
  rect(15, 15, 280, 110);

  fill(255);
  textSize(14);
  text("INDbox Recursive Layout", 30, 40);
  text("pot: split position = " + nf(box.pot(), 1, 2), 30, 62);
  text("button 1: toggle direction", 30, 84);
  text("button 2: increase depth = " + depth, 30, 106);

  String mode = splitVertical ? "vertical split" : "horizontal split";
  text("mode: " + mode, 30, 128);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    depth = 0;
    splitVertical = true;
  }
}
