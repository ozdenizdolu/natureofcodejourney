ConnectedWalkers[] connectome;
int WIDTH = 1280;
int HEIGHT = 720;
int size = 20;

void setup() {
    size(WIDTH, HEIGHT);
    background(255);
    connectome = new ConnectedWalkers[size];
    for (int i = 0; i < size; ++i) {
        connectome[i] = new ConnectedWalkers(round(random(WIDTH)), round(random(HEIGHT)), round(random(250)), round(random(10)));
    }
}

void draw() {
    clear();
    background(255);
    for (ConnectedWalkers con : connectome) {
        con.step();
        con.display();
    }
}
