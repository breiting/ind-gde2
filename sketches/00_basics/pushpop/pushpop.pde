void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  push();
  translate(width/4, height/4);
  noStroke();
  fill(255, 0, 0);
  circle(0, 0, 20);
  pop();

  push();
  translate(width*3/4, height/4);
  fill(0, 255, 0);
  circle(0, 0, 20);
  pop();

  push();
  translate(width/4, height*3/4);
  fill(0, 0, 255);
  circle(0, 0, 20);
  pop();

  push();
  translate(width*3/4, height*3/4);
  fill(255);
  circle(0, 0, 20);
  pop();

  noLoop(); // do not continue!
}
