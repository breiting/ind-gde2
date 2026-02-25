/*
  02_time_framerate.pde
  Topic: Time and frame rate

  Key concept:
  - draw() runs repeatedly (frames).
  - frameCount counts how many frames have passed.
  - frameRate is the target FPS (frames per second).
  - millis() is real time since the sketch started (in milliseconds).

  Design hint:
  Use time to create rhythm: steady motion, pulses, or slow changes.
*/

void setup() {
  size(640, 360);
  textSize(16);

  // Try changing this:
  frameRate(30); // 30 FPS target
}

void draw() {
  background(250);

  // Frame-based time (depends on FPS)
  int f = frameCount;

  // Real time in seconds (more stable across machines)
  float t = millis() / 1000.0;

  fill(0);
  text("frameCount: " + f, 20, 40);
  text("millis (s): " + nf(t, 0, 2), 20, 70);
  text("current FPS: " + nf(frameRate, 0, 1), 20, 100);

  // A simple visual pulse using time:
  // sin() gives a smooth wave between -1..1
  float pulse01 = (sin(TWO_PI * 0.8 * t) + 1) * 0.5; // 0..1
  float sizePx = lerp(20, 160, pulse01);

  noStroke();
  fill(20);
  ellipse(width * 0.75, height * 0.5, sizePx, sizePx);
}
