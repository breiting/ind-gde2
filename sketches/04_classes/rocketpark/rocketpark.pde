class Rocket {

  PVector position;
  PVector velocity;
  float speed;
  PShape shp;
  float margin = 30;
  float lifeSpan = 100;

  Rocket(PVector pos) {
    speed = random(2, 10);
    position = pos.copy();

    float angle = random(TWO_PI);
    velocity = PVector.fromAngle(angle);
    velocity.mult(speed);

    shp = loadShape("rocket.svg");
  }

  void update() {
    position.add(velocity);

    if (position.x < margin || position.x > width - margin) {
      velocity.x *= -1;
    }

    if (position.y < margin || position.y > height - margin) {
      velocity.y *= -1;
    }
    lifeSpan -= 1;
  }

  boolean isDead() {
    return lifeSpan <= 0;
  }

  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading()+HALF_PI);
    scale(0.5);
    shape(shp, 0, 0);
    popMatrix();
  }
}

Rocket rocket1;
Rocket rocket2;

ArrayList<Rocket> rockets;


void setup() {
  size(800, 800);
  shapeMode(CENTER);

  rockets = new ArrayList<Rocket>();

  rocket1 = new Rocket(new PVector(width*0.3, height/2));
  rocket2 = new Rocket(new PVector(width*0.7, height/2));
}

void draw() {
  background(0);
  rocket1.update();
  rocket1.draw();

  rocket2.update();
  rocket2.draw();

  for (int i = rockets.size() - 1; i >= 0; i--) {
    Rocket r = rockets.get(i);
    if (r.isDead()) {
      rockets.remove(i);
    } else {
      r.update();
      r.draw();
    }
  }
}

void keyPressed() {
  if (key == 's') {
    rockets.add(new Rocket(new PVector(width/2, height/2)));
  }
}
