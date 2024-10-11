class Calculator {
  private double currentValue;
  private double previousValue;
  private String operation;

  Calculator() {
    clear();
  }

  void setOperation(String operation) {
    this.operation = operation;
  }

  void setPreviousValue(double value) {
    previousValue = value;
  }

  void setCurrentValue(double value) {
    currentValue = value;
  }

  double calculate() {
    switch (operation) {
      case "+":
        return previousValue + currentValue;
      case "-":
        return previousValue - currentValue;
      case "x":
        return previousValue * currentValue;
      case "/":
        if (currentValue != 0) {
          return previousValue / currentValue;
        } else {
          // Handle division by zero
          return Double.NaN;
        }
      default:
        return currentValue;
    }
  }

  void clear() {
    currentValue = 0;
    previousValue = 0;
    operation = "";
  }
}
