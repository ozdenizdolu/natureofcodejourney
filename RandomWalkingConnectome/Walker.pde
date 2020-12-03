class Walker {
    int x;
    int y;
    
    Walker(int x, int y) {
        this.x = x;
        this.y = y;
    } 

    void display() {
        stroke(0);
        point(x,y); 
    }
    
    void step() {
        x += round(random(2) - 1);
        y += round(random(2) - 1);
    }
}
