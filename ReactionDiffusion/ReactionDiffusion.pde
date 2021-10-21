int WIDTH = 700, HEIGHT = 700;

float dA = 1.0,
    dB = 0.5,
    fb = 0.055,
    k = 0.062;

float[][] laplace = {
    {0.05, 0.2, 0.05},
    {0.2, -1, 0.2},
    {0.05, 0.2, 0.05},
};

float t = 0.0;

float[][][] grid, next;      

// Apply the convolution to a point x,y in grid
float applyConvolution(float[][] conv, int[] coords) {
    float sum = 0.0;
    int x = coords[0];
    int y = coords[1];
    int calcX, calcY;
    for(int i = -1; i < 2; i++) {
        for(int j = -1; j < 2; j++) {
            calcX = (x + i + WIDTH) % WIDTH;
            calcY = (y + j + HEIGHT) % HEIGHT;
            sum += grid[calcX][calcY][coords[2]] * conv[i + 1][j + 1];
        }
    }
    return sum;
}

// Fill the grid with substance B 
// on a rectangle at x,y with dimensions a,b 
void initializeGridRect(int x, int y, int a, int b) {
    for(int i = -a/2; i < a/2; i++) {
        for(int j = -b/2; j < b/2; j++) {
            grid[x + i][y + j][1] = 1.0;
        }
    }
}
// Fill the grid with substance B
// on a circle at x,y with inner radius r1 and outer radius r2
void initializeGridCircle(int x, int y, float r1, float r2) {
    for(int i = 0; i < WIDTH; i++) {
        for(int j = 0; j < HEIGHT; j++) {
            float absDist = abs(dist(i,j,x,y));
            if (absDist > r1 && absDist < r2) {
                grid[i][j][1] = 1.0;
            }
        }
    }
}
void setup() {
    size(WIDTH, HEIGHT);
    grid = new float[WIDTH][HEIGHT][2];
    next = new float[WIDTH][HEIGHT][2];
    for(int i = 0; i < WIDTH; i++) {
        for(int j = 0; j < HEIGHT; j++) {
            grid[i][j][0] = 1.0;
            grid[i][j][1] = 0.0;
            next[i][j][0] = 0.0;
            next[i][j][1] = 0.0;
        }
    }
    for(int i = 1; i < 20; i++) {
        initializeGridCircle(width/2, height/2, i*28.0, i*30.0);
    }
    initializeGridRect(width/2, height/2, 300, 300);
}
void draw() {
    float a, b;
    for(int i = 0; i < WIDTH; i++) {
        for(int j = 0; j < HEIGHT; j++) {
            a = grid[i][j][0];
            b = grid[i][j][1];
            next[i][j][0] = a +  
                            (dA * applyConvolution(laplace, new int[]{i, j, 0})) - 
                            (a * b * b) + 
                            (fb * (1 - a));
            next[i][j][1] = b +
                            (dB * applyConvolution(laplace, new int[]{i, j, 1})) +
                            (a * b * b) - 
                            ((k + fb) * b);
            next[i][j][0] = constrain(next[i][j][0], 0.0, 1.0);
            next[i][j][1] = constrain(next[i][j][1], 0.0, 1.0);
            a = next[i][j][0];
            b = next[i][j][1];
            float colorA = constrain((a / (a+b))*255, 0, 255);

            set(i,j, color(colorA));
        }
    }
    t += 0.01;
    dB = noise(t);
    float[][][] temp = grid;
    grid = next;
    next = temp;
    
}