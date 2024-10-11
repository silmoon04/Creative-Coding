// Global Variables
Calculator calculator;
Display display;
Button[] buttons;
PFont poppins;

void setup() {
  size(400, 600);
  poppins = createFont("Poppins-Medium.ttf", 30);
  textFont(poppins);
  calculator = new Calculator();
  display = new Display("");

  // Create buttons for digits and operations
  buttons = new Button[16];

  // Buttons for digits 0-9 and operations (+, -, *, /), equals (=), and clear (C)
  buttons[0] = new Button(18, 304, "7");
  buttons[1] = new Button(110, 304, "8");
  buttons[2] = new Button(202, 304, "9");
  buttons[3] = new Button(294, 304, "/");
  buttons[4] = new Button(18, 376, "4");
  buttons[5] = new Button(110, 376, "5");
  buttons[6] = new Button(202, 376, "6");
  buttons[7] = new Button(294, 376, "x");
  buttons[8] = new Button(18, 448, "1");
  buttons[9] = new Button(110, 448, "2");
  buttons[10] = new Button(202, 448, "3");
  buttons[11] = new Button(294, 448, "-");
  buttons[12] = new Button(18, 520, "C");
  buttons[13] = new Button(110, 520, "0");
  buttons[14] = new Button(202, 520, "=");
  buttons[15] = new Button(294, 520, "+");
}

void draw() {
  background(0);
  display.render();

  for (Button button : buttons) {
    if (button != null) button.display();
  }
}

void mousePressed() {
  for (Button button : buttons) {
    if (button != null && button.isClicked(mouseX, mouseY)) {
      String label = button.label;

      // Handle digit input
      if (Character.isDigit(label.charAt(0))) {
        display.update(label);
      }

      // Handle operations
      else if (label.equals("+") || label.equals("-") || label.equals("x") || label.equals("/")) {
        if (!display.getText().isEmpty()) {
          calculator.setPreviousValue(Double.parseDouble(display.getText()));
        }
        calculator.setOperation(label);
        display.setSecondaryText(display.getText() + " " + label); // Set secondary display
        display.clear();
      }

      // Handle equals
      else if (label.equals("=")) {
        if (!display.getText().isEmpty()) {
          calculator.setCurrentValue(Double.parseDouble(display.getText()));
          double result = calculator.calculate();
          display.setText(Double.toString(result));
          display.clearSecondaryText();
          calculator.clear(); // Clear calculator state after calculation
        }
      }

      // Handle clear
      else if (label.equals("C")) {
        calculator.clear();
        display.clear();
        display.clearSecondaryText();
      }
    }
  }
}
