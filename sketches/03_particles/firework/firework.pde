ArrayList<Particle> particles;

void setup() {
  size(800, 800);
  particles = new ArrayList<Particle>();
  noStroke();
  background(0);
}

void draw() {
  fill(0, 25);
  rect(0, 0, width, height);

  particles.add(new Particle(width / 2, height, random(4, 8)));

  // From back to front in order to remove dead particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.show();

    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  float lifespan;

  Particle(float x, float y, float s) {
    position = new PVector(x, y);

    // Start direction upward
    velocity = new PVector(random(-2, 2), random(-11, -5));

    // Add some graviation
    acceleration = new PVector(0, 0.08);

    size = s;
    lifespan = 500;
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2;
  }

  void show() {
    fill(255, lifespan);
    circle(position.x, position.y, size);
  }

  boolean isDead() {
    return lifespan <= 0;
  }
}
