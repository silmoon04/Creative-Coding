class Bubble {
  int x, y;
  int colorIndex;
  int size;

  Bubble(int x, int y, int colorIndex, int size) {
    this.x = x;
    this.y = y;
    this.colorIndex = colorIndex;
    this.size = size;
  }

  void draw(int colorIndex, int x, int y, int size) {
    int bubbleX = 200 + x;  // adjust x position of the bubble
    int bubbleY = 200 + y;  // adjust y position of the bubble
    int bubbleSize = 25 * size;  // calculate size of the bubble

    // main circle (the bubble itself)
    noStroke();
    fill(colors[colorIndex][0], colors[colorIndex][1], colors[colorIndex][2]);  // set fill color based on bubble color
    circle(bubbleX, bubbleY, bubbleSize);  // draw the bubble

    // inner shadow
    noFill();  // no fill for the shadow arcs
    for (int i = 1; i < 12; i = i * 2) {
      stroke(0, 0, 0, 1);  // set stroke color for shadow
      strokeWeight(bubbleSize / 5);  // set stroke thickness for shadow
      arc(bubbleX, bubbleY, bubbleSize - bubbleSize / 5 - i, bubbleSize - bubbleSize / 5 - i, radians(140), radians(300));  // draw shadow arc
    }

    // highlight on the bubble
    noFill();  // no fill for highlight
    strokeWeight(bubbleSize / 10);  // set stroke thickness for highlight
    stroke(240, 220, 200, 120);  // set stroke color for highlight
    arc(bubbleX, bubbleY, bubbleSize * 0.70, bubbleSize * 0.70, radians(-20), radians(100));  // draw highlight arc
  }
}
