import java.util.Arrays;

final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  // STEP 1 - Populate initial grid (you may want to use Arrays.toString to check it)
  for(int row = 0; row < height / SPACING; row++){
    for(int col = 0; col < width / SPACING; col++){
      if(Math.random() < DENSITY){
        grid[row][col] = 1;
      } else{
        grid[row][col] = 0;
      }
    }
  }
}

void draw() {
  showGrid(); // STEP 2 - Implement this method so you can see your 2D array
  // grid = calcNextGrid(); // uncomment this after you get showGrid() working
  
 
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  int count = 0;
  // your code here
  // don't check out-of-bounds cells!
  if(grid[x-1][y] == 1){ // to the left
    count++;
  }
  if(grid[x-1][y+1] == 1){ //to the left up
    count++;
  }
  if(grid[x-1][y-1] == 1){ //to the left down
    count++;
  }
  if(grid[x][y+1] == 1){ //up
    count++;
  }
  if(grid[x][y-1] == 1){ //down
    count++;
  }
  if(grid[x+1][y+1] == 1){ //to the right up
    count++;
  }
  if(grid[x+1][y-1] == 1){ //to the right down
    count++;
  }
  if(grid[x+1][y] == 1){ //to the right 
    count++;
  }
  if ((grid[x][y] == 1) && (count <= 1) || (count >= 4)){ //if populated reason for death
    grid[x][y]= 0;
  }
  if((grid[x][y] == 1) && (count == 2) || (count == 3)){ //if populated reason for survival
    grid[x][y]= 1;
  }
  if((grid[x][y] == 0) && (count == 3)){ //if unpopulated reason for life;
    grid[x][y] = 1;
  }
  
  return n;
}

void showGrid() {
  // your code here
  for(int row = 0; row < height / SPACING; row++){
    for(int col = 0; col < width / SPACING; col++){
      if(grid[row][col] == 1){
        fill(255,0,0);
      } else{
        fill(0,0,0);
      }
      square(col * SPACING, row * SPACING, SPACING);
    }
  }
  // use square() to represent each cell
  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
  // each square (cell) has a width and height of SPACING. 
  // you will need to calculate the x and y position as you loop through the grid

}
