class Button {
  private float x, y;
  private float width = 90, height = 70;
  public String label;

  Button(float x, float y, String label) {
    this.x = x;
    this.y = y;
    this.label = label;
  }

  public boolean isClicked(float mouseX, float mouseY) {
    return mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height;
  }

  void display() {
    // Set color based on button type
    if (label.equals("+") || label.equals("-") || label.equals("x") || label.equals("/") || label.equals("=") || label.equals("C")) {
      fill(30);
    } else {
      fill(62);
    }
    rect(x, y, width, height, 10, 10, 10, 10); // Draw the button
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(poppins);
    text(label, x + width / 2, y + height / 2); // Draw the label at the center of the button
  }
}
