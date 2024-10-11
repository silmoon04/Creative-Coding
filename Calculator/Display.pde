class Display {
  private String displayText;
  private String secondaryText;

  Display(String displayText) {
    this.displayText = displayText;
    this.secondaryText = "";
  }

  void update(String text) {
    displayText += text; // Append new text to the current display
  }

  void clear() {
    displayText = ""; // Clear the display
  }

  void setText(String text) {
    displayText = text;
  }

  String getText() {
    return displayText;
  }

  void setSecondaryText(String text) {
    secondaryText = text;
  }

  void clearSecondaryText() {
    secondaryText = "";
  }

  void render() {
    fill(255);
    textAlign(RIGHT, CENTER);

    // Display secondary text (previous value and operation) at the top
    fill(128);
    textSize(20);
    text(secondaryText, width - 20, 50);

    // Display main text (current input) below secondary text
    fill(255);
    textSize(32);
    text(displayText, width - 20, 100);
  }
}
