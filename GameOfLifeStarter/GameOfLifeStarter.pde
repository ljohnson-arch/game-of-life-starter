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
  int count = 0;
  // your code here
  // don't check out-of-bounds cells!

  for(int dy = -1; dy <= 1; dy++){
    for(int dx = -1; dx <= 1; dx++){
      if (dy == 0 && dx == 0){
        continue; 
      } 

      int ny = y + dy; //neighboring cell
      int nx = x + dx;

      //out of bounds check 
      if(ny >= 0 && ny < grid.length && nx >= 0 && nx < grid[0].length){
        if(grid[ny][nx] == 1){
          count++;
        }
      }
    }
  }
  
  return count;
}

void showGrid() {
  // your code here
  for(int row = 0; row < grid.length; row++){
    for(int col = 0; col < grid[0].length; col++){
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
