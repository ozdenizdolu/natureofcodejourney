Walker[] walkers;
int WIDTH = 640;
int HEIGHT = 360;

void setup() {
    size(WIDTH, HEIGHT);
    background(255);
    walkers = new Walker[22];
    
    for (int i = 0; i < walkers.length; ++i) {
        walkers[i] = new Walker();
        walkers[i].x = int(random(WIDTH));
        walkers[i].y = int(random(HEIGHT));
    }
}

void draw() {
    clear();
    background(255);
    for (int i = 0; i < walkers.length; ++i) {
        walkers[i].step();
    }

    for(int i = 0; i < walkers.length; ++i) {
        for (int j = 0; j < walkers.length; ++j) {
            stroke(0);
            line(walkers[i].x, walkers[i].y, walkers[j].x, walkers[j].y);
        }
    }
}
