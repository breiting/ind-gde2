// Function Playground — Generative Design Basics (Processing 4)
// Keys 1..5 switch demos. Space = pause. R = reset.
// Focus: linear -> sin/cos -> pow -> exp -> noise -> flow lines -> phyllotaxis

int mode = 1;
boolean paused = false;
int baseFrame = 0;

// helpers for demo state
float t = 0;
int n = 0;

void settings() {
  size(900, 700);
}

void setup() {
  surface.setTitle("Function Playground — 1..5");
  colorMode(HSB, 255);
  resetDemo();
}

void draw() {
  if (!paused) {
    t = (frameCount - baseFrame) * 0.02;  // shared time
  }

  background(0);

  switch(mode) {
  case 1: demoLinear(); break;
  case 2: demoSinCos(); break;
  case 3: demoRadialSin(); break;
  case 4: demoPow(); break;
  case 5: demoExp(); break;
  }

  drawHUD();
}

void drawHUD() {
  fill(0, 0, 0, 170);
  noStroke();
  rect(12, 12, 420, 92, 12);

  fill(0, 0, 255);
  textSize(14);
  text("1 Linear  2 Sin/Cos  3 Radial Sin  4 pow()  5 exp()  5 Noise Flow Lines", 24, 38);
  text("SPACE pause  |  R reset  |  1..5 switch", 24, 60);

  String title = "";
  if (mode == 1) title = "Linear: constant change (neutral, mechanical)";
  if (mode == 2) title = "Sin/Cos: smooth oscillation (rhythm, breathing)";
  if (mode == 3) title = "Radial Sin: waves & interference (field-like motion)";
  if (mode == 4) title = "pow(x,k): personality mapping (soft vs dramatic)";
  if (mode == 5) title = "exp(x): acceleration (intensity, explosion)";

  fill(0, 0, 200);
  text(title, 24, 84);
}

void resetDemo() {
  background(0);
  n = 0;
  baseFrame = frameCount;
}

void keyPressed() {
  if (key >= '1' && key <= '5') {
    mode = key - '0';
    resetDemo();
  }
  if (key == ' ') paused = !paused;
  if (key == 'r' || key == 'R') resetDemo();
}

/* -------------------------
   1) LINEAR
   ------------------------- */
void demoLinear() {
  // A linear ramp across time: x increases at constant rate.
  // Visual: a square that moves + a bar that fills.
  float x = (t * 120) % (width - 120) + 60;

  // linear progress 0..1 looping
  float p = (x - 60) / (width - 120);

  noFill();
  stroke(0, 0, 255);
  strokeWeight(2);
  line(60, height*0.65, width-60, height*0.65);

  // moving square
  noStroke();
  fill(40, 200, 255);
  rectMode(CENTER);
  rect(x, height*0.65, 28, 28, 6);

  // a very "neutral" linear bar
  fill(0, 0, 255, 70);
  rectMode(CORNER);
  rect(60, height*0.75, (width-120)*p, 18, 6);

  // dots that are evenly spaced: linear sampling
  for (int i = 0; i < 40; i++) {
    float xi = map(i, 0, 39, 60, width-60);
    float yi = height*0.35 + sin(t*0.0) * 0; // intentionally no motion
    fill(0, 0, 255, 120);
    ellipse(xi, yi, 5, 5);
  }
}

/* -------------------------
   2) SIN / COS
   ------------------------- */
void demoSinCos() {
  // Sinus is an oscillator: same input t gives smooth periodic output.
  // Visual: breathing circle + phase-shifted twin.

  float a = 90;                 // amplitude
  float r1 = 120 + sin(t) * a;  // breathing
  float r2 = 120 + sin(t + PI/2) * a; // phase shift

  noStroke();
  fill(170, 200, 255, 200);
  ellipse(width*0.35, height*0.52, r1, r1);

  fill(20, 200, 255, 200);
  ellipse(width*0.65, height*0.52, r2, r2);

  // small waveform strip (so they "see" the function)
  stroke(0, 0, 255, 200);
  noFill();
  beginShape();
  for (int x = 0; x < width; x += 6) {
    float tt = t + x * 0.02;
    float y = height*0.22 + sin(tt) * 28;
    vertex(x, y);
  }
  endShape();
}

/* -------------------------
   3) RADIAL SIN FIELD
   ------------------------- */
void demoRadialSin() {
  // Radial waves: sin(distance + time) → interference feeling.
  // Visual: deformed grid of circles + subtle radial rings.

  float cx = width/2;
  float cy = height/2;

  int cols = 32;
  int rows = 22;
  float sx = (width - 120) / float(cols-1);
  float sy = (height - 160) / float(rows-1);

  noStroke();
  for (int iy = 0; iy < rows; iy++) {
    for (int ix = 0; ix < cols; ix++) {
      float x = 60 + ix * sx;
      float y = 80 + iy * sy;
      float d = dist(x, y, cx, cy);

      float wave = sin(d*0.02 - t*2.0); // key idea
      float s = 6 + (wave * 0.5 + 0.5) * 14;

      float hue = map(wave, -1, 1, 140, 200);
      fill(hue, 200, 255, 220);
      ellipse(x, y, s, s);
    }
  }

  // radial rings (just to emphasize "distance -> sin")
  stroke(0, 0, 255, 70);
  noFill();
  for (int i = 0; i < 8; i++) {
    float rr = 60 + i * 45 + sin(t + i) * 10;
    ellipse(cx, cy, rr*2, rr*2);
  }
}

/* -------------------------
   4) POW MAPPING
   ------------------------- */
void demoPow() {
  // pow(x,k): same input ramp, different output character.
  // Visual: three columns of quads whose height is mapped by k.
  // k < 1 = soft early response, k > 1 = delayed then dramatic.

  float xNorm = (sin(t*0.7) * 0.5 + 0.5); // 0..1 input (oscillating for demo)
  float k1 = 0.5;  // soft
  float k2 = 1.0;  // linear
  float k3 = 2.5;  // dramatic

  float y1 = pow(xNorm, k1);
  float y2 = pow(xNorm, k2);
  float y3 = pow(xNorm, k3);

  float baseY = height*0.82;
  float maxH = height*0.55;

  drawPowColumn(width*0.25, baseY, maxH, y1, "k=0.5 (soft)");
  drawPowColumn(width*0.50, baseY, maxH, y2, "k=1.0 (linear)");
  drawPowColumn(width*0.75, baseY, maxH, y3, "k=2.5 (dramatic)");

  // input indicator
  fill(0, 0, 255);
  textSize(14);
  text("Input x (0..1) = " + nf(xNorm, 1, 2), 60, 140);
}

void drawPowColumn(float cx, float baseY, float maxH, float v, String label) {
  float h = v * maxH;

  // frame
  stroke(0, 0, 255, 90);
  noFill();
  rectMode(CENTER);
  rect(cx, baseY - maxH/2, 170, maxH, 14);

  // filled quad
  noStroke();
  float hue = map(v, 0, 1, 180, 20);
  fill(hue, 200, 255, 220);
  rect(cx, baseY - h/2, 170, h, 14);

  fill(0, 0, 255);
  textAlign(CENTER, CENTER);
  text(label, cx, baseY + 28);
  textAlign(LEFT, BASELINE);
}

/* -------------------------
   5) EXP
   ------------------------- */
void demoExp() {
  // exp-like acceleration: small changes early, fast changes later.
  // Visual: particles shooting outward with accelerating radius.

  float cx = width/2;
  float cy = height/2;

  int dots = 180;
  noStroke();

  for (int i = 0; i < dots; i++) {
    float a = map(i, 0, dots, 0, TWO_PI);

    // time phase per dot
    float tt = (t*0.35 + i*0.004) % 1.0; // 0..1
    // exponential easing (normalize-ish)
    float e = (exp(tt*3.0) - 1.0) / (exp(3.0) - 1.0); // 0..1, accelerates
    float r = e * (min(width, height)*0.46);

    float x = cx + cos(a) * r;
    float y = cy + sin(a) * r;

    float s = 2 + e * 7;
    float hue = map(e, 0, 1, 150, 10);
    fill(hue, 220, 255, 210);
    ellipse(x, y, s, s);
  }

  // center glow
  fill(0, 0, 255, 120);
  ellipse(cx, cy, 24, 24);
}

