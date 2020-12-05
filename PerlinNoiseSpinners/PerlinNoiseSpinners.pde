Spinner[] s;
int WIDTH = 1280;
int HEIGHT = 720;

void setup() {
    size(WIDTH, HEIGHT);
    background(0);
    s = new Spinner[3];
    s[0] = new Spinner(0, HEIGHT/4, 2000, PI/2 + 1, 0.01);
    s[1] = new Spinner(0, HEIGHT/2, 2000, PI/2 + 2, 0.01);
    s[2] = new Spinner(0, 3*HEIGHT/4, 2000, PI/2, 0.01);
    
   
}

void draw() {
    // clear();
    for (int i = 0; i < s.length; ++i) {
        s[i].step();
        s[i].display(); 
    }
}
