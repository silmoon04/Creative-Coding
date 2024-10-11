class Grid {
  Bubble[][] bubbles;
  int rows, columns;

  Grid(int rows, int columns) {
    this.rows = rows;
    this.columns = columns;
    bubbles = new Bubble[rows][columns];
  }

  void initialize() {
    for (int x = 0; x < 76; x++) {
      for (int y = 0; y < 9; y++) {
        bubbleGrid[x][y] = generateBubbleColor(); // assign a random color to each bubble in the grid
      }
    }

    // generate 63 random colored bubbles to shoot
    for (int i = 0; i<63; i++) {
      bubblesAvailable[i] = generateBubbleColor(); // fill bubblesAvailable with random colors
    }
  }

  void draw() {
    // Loop through the grid and call draw() on each bubble
  }

  // Add other methods for grid management
}
