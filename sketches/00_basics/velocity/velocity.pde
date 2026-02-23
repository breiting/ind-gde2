PVector position;
PVector velocity;

void setup() {
  size(600, 400);
  
  position = new PVector(50, height/2);
  
  velocity = new PVector(3, 0);
}

void draw() {
  background(255);
  
  position.add(velocity);
  
  circle(position.x, position.y, 40);

  if (position.x < 0 || position.x > width) {
    velocity.x *= -1;
  }
}
