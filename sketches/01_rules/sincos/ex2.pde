// y = A*sin(Bx+C)+D
// A amplitude
// B frequency
// C phase
// D vertical

void setup() {
  size(800,800);
  fill(255);
  //noStroke();
}


void draw() {
  //background(0);
  float x = cos(frameCount*0.05);
  float y = sin(frameCount*0.06);
  
  float valx = map(x, -1, 1, width, 0);
  float valy = map(y, -1, 1, height, 0);
  circle(valx, valy, 20);
}
