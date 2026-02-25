/*
  03_coordinate_systems.pde
  Topic: Coordinate systems

  Key concept:
  - (0,0) is top-left
  - x increases to the right
  - y increases downward
  - width and height are the canvas size

  Design hint:
  Coordinates are composition decisions: center, margins, alignment, grid.
*/

void setup() {
  size(640, 360);
  textSize(14);
}

void draw() {
  background(255);

  // Draw axes / guides
  stroke(230);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  // Mark important points
  noStroke();
  fill(0);

  // top-left
  ellipse(0, 0, 10, 10);
  text("(0,0)", 12, 16);

  // center
  ellipse(width/2, height/2, 10, 10);
  text("(width/2, height/2)", width/2 + 12, height/2 - 8);

  // bottom-right
  ellipse(width, height, 10, 10);
  text("(width,height)", width - 110, height - 10);

  // Mouse position as a coordinate probe
  fill(20);
  text("mouseX: " + mouseX + "  mouseY: " + mouseY, 12, height - 16);

  stroke(0, 40);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}
