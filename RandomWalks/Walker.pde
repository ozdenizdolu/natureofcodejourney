class Walker {
    int x;
    int y;
    
    Walker() {
        x = width/2;
        y = height/2;
    } 

    void display() {
        stroke(0);
        point(x,y); 
    }
    
    void step() {
        x += round(random(-1,1));
        y += round(random(-1,1));
    }
}
