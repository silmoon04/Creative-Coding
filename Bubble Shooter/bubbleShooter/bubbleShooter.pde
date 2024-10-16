import java.util.Arrays;
import java.lang.Math;


int[][] colors = {
  {255, 173, 173}, // color 1
  {255, 214, 165}, // color 2
  {253, 255, 182}, // color 3
  {202, 255, 191}, // color 4
  {155, 246, 255}, // color 5
  {160, 196, 255}, // color 6
  {189, 178, 255}   // color 7
};

byte[][] bubbleGrid = new byte[76][9];  // grid to store bubble colors
byte[] bubblesAvailable = new byte[63]; // available bubbles to shoot
int centerX = 800;  // center of the aiming point (x-axis)
int centerY = 700;  // center of the aiming point (y-axis)

void setup()
{
  size(1920, 1080);  // set the screen size

  // store colors of the bubbles at the top of the screen in a 2 dimensional array
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
  background(#073b4c);  // set the background color

  noFill();
  strokeWeight(15);  // set the border thickness
  rect(0, 0, 1920, 1078);  // draw the border for the screen

  // draw bubbles at the top of the screen
  for (int x = 0; x < 76; x++) {
    for (int y = 0; y < 9; y++) {
      bubble(bubbleGrid[x][y], (x-7)*25, (y-7)*25, 1);  // draw each bubble on the grid
    }
  }

  // draw the aiming dotted line
  strokeWeight(10);  // set the thickness of the line
  float distance = dist(centerX, centerY, mouseX, mouseY);  // calculate distance from center to mouse
  int numberOfPoints = (int)distance / 15;  // determine how many points to draw on the line
  
  // set the color of the line based on the bubble available to shoot
  stroke(colors[bubblesAvailable[0]][0], colors[bubblesAvailable[0]][1], colors[bubblesAvailable[0]][2], 100);
  
  // draw the dotted line by creating points between the center and mouse position
  for (int i = 0; i <= numberOfPoints; i++) {
    float x = lerp(centerX + 200, mouseX, i / (float)numberOfPoints);  // calculate x position
    float y = lerp(centerY + 200, mouseY, i / (float)numberOfPoints);  // calculate y position
    point(x, y);  // draw the point at (x, y)
  }

  bubblesToShoot();  // call function to show bubble ready to shoot
}

void bubblesToShoot() {
  bubble(bubblesAvailable[0], centerX, centerY, 2);  // draw the next bubble to shoot at the center
}

byte generateBubbleColor() {
  return (byte)random(0, 6);  // generate a random color index between 0 and 6
}

void bubble(int colorIndex, int x, int y, int size) {
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
