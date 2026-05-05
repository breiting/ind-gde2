import processing.sound.*;

float angle = radians(30); // degrees
float len = 200;
float scale = 0.7;
int beatCount = 30;
int beatFrame;

float level;

SoundFile song;
Amplitude amp;

void setup() {
  size(800, 800);
  stroke(255);
  noFill();

  song = new SoundFile(this, "zombie.mp3");
  song.loop();

  amp = new Amplitude(this);
  amp.input(song);
}

void branch(float len, float depth) {
  if (depth <= 0) {
    return;
  }

  strokeWeight(depth);

  line(0, 0, 0, -len);

  // set point
  translate(0, -len);

  pushMatrix();
  rotate(angle);
  branch(len * scale, depth - 1);
  popMatrix();

  pushMatrix();
  rotate(-angle);
  branch(len * scale, depth - 1);
  popMatrix();
}

void draw() {
  background(0);

  level = amp.analyze();
  // println(level);

  angle = map(level, 0, 1, radians(0), radians(90));
  float depth = 7; // map(mouseY, 0, height, 1, 10);

  // define starting point
  translate(width / 2, height - 80);
  branch(180, depth);
}
