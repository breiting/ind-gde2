/*
  04_drawing_color.pde
  Topic: Drawing basics (background, stroke, fill)

  Key concept:
  - background() clears the canvas each frame
  - fill() sets the inside color of shapes
  - stroke() sets the outline color
  - noStroke() / noFill() turn them off

  Design hint:
  Color + stroke weight define hierarchy, contrast, and mood.
*/

void setup() {
  size(640, 360);
}

void draw() {
  background(245);

  // Example 1: filled shape, no stroke
  noStroke();
  fill(30);
  ellipse(160, 180, 140, 140);

  // Example 2: stroke + fill
  stroke(color(255, 0, 0));
  strokeWeight(6);
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(320, 180, 160, 160);

  // Example 3: stroke only
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(500, 180, 160, 160);

  // Tiny labels
  fill(0);
  text("fill only", 120, 330);
  text("stroke + fill", 280, 330);
  text("stroke only", 440, 330);
}
