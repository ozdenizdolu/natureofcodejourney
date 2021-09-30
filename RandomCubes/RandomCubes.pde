final int WIDTH = 1000, 
        HEIGHT = 1000, 
        n = 100;  

class Cube {
    PVector pos, vel;
    float radiusA, radiusB;
    public Cube() {
        this.pos = new PVector(random(width), random(height));
        this.vel = new PVector(random(-1, 1), random(-1, 1));
        this.radiusA = random(25);
        this.radiusB = random(25);
    }
    void draw() {
        rect(pos.x, pos.y, radiusA, radiusB);
        pos.add(vel);
        if (pos.x < 0) pos.x = pos.x + width;
        if (pos.y < 0) pos.y = pos.y + height;
        if (pos.x > width) pos.x = pos.x - width;
        if (pos.y > height) pos.y = pos.y - height;
    }
}

ArrayList<Cube> cubes;

void setup() {
    size(WIDTH, HEIGHT);
    background(0);
    cubes = new ArrayList<Cube>();
    for (int i = 0; i < n; i++) {
        cubes.add(new Cube());
    }
 }

void draw() {
    background(0);
    noStroke();
    fill(255);
    for (Cube cube : cubes) {
        cube.draw();
    }
}
