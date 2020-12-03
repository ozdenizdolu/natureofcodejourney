class ConnectedWalkers {
    Walker[] walkers;
    
    // Create randomly positioned n walkers in the r radius disk centered at (x,y)
    ConnectedWalkers(int x, int y, int r, int n) {
        walkers = new Walker[n];
        for (int i = 0; i < n; ++i) {
            float theta = random(2*PI);
            float distance = random(r);
            int walkerX = round(x + distance*cos(theta));
            int walkerY = round(y + distance*sin(theta));
            walkers[i] = new Walker(walkerX, walkerY);
        }
    } 

    void display() {
        for(int i = 0; i < walkers.length; ++i) {
            for (int j = 0; j < walkers.length; ++j) {
                stroke(0);
                line(walkers[i].x, walkers[i].y, walkers[j].x, walkers[j].y);
            }
        }
    }
    
    void step() {
        for (Walker w : walkers) w.step(); 
    }
}
