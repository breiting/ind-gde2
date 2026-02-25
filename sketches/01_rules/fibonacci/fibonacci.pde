// Fibonacci / Phyllotaxis Pattern

float goldenAngle = radians(137.5);
float scaleFactor = 6;     // Distance between points
int pointCount = 800;      // Number of seeds
float pointSize = 6;

void settings() {
  size(800, 800);
}

void setup() {
  background(10);
  noStroke();
}

void draw() {
  background(10);
  translate(width/2, height/2); // set origin

  for (int n = 0; n < pointCount; n++) {
    float angle = n * goldenAngle;
    float radius = scaleFactor * sqrt(n);

    float x = cos(angle) * radius;
    float y = sin(angle) * radius;

    // Coloring
    float hue = map(n, 0, pointCount, 0, 255);

    colorMode(HSB, 255);
    fill(hue, 200, 255);

    circle(x, y, pointSize);
  }
}
