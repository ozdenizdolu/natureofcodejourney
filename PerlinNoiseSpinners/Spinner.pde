class Spinner {
    int x;
    int y;
    int r;
    float theta = 0;
    float t = random(50);
    float rotSpeed = 0.1;
    float hue = 100;
    
    PGraphics pg;
    
    Spinner(int x, int y, int r, float theta) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.theta = theta;
        pg = createGraphics(width, height);
    } 

    Spinner(int x, int y, int r, float theta, float rotSpeed) {
        this(x,y,r,theta);
        this.rotSpeed = rotSpeed;
    }

    void display() {
        int firstX = x + round(r*cos(theta));
        int firstY = y - round(r*sin(theta));
        int secondX = x - round(r*cos(theta));
        int secondY = y + round(r*sin(theta));
        pg.beginDraw();
        pg.clear();
        pg.colorMode(HSB, 255);
        pg.strokeWeight(5);
        pg.stroke(hue, 255, 255);
        pg.line(firstX, firstY, secondX, secondY);
        pg.endDraw();
        int mode = frameCount % 2 == 0 ? HARD_LIGHT : DIFFERENCE ;
        blend(pg, 0,0,width,height,0,0,width,height, mode  );
    }
    
    void step() {
        x += round(map(noise(t), 0, 1, 0, 3));
        x %= width;
        y += round(map(noise(t+100), 0, 1, -2, 2));
        if(y < 0) y += height;
        y %= height;

        hue += map(noise(t+100), 0, 1, -5, 5);
        if(hue < 0) hue += 255;
        hue %= 255;

        theta += rotSpeed;

        t += 0.01;
    }
}
