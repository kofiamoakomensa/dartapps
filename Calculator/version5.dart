import 'dart:io';

double add(double x, double y) {
  return x + y;
}

double subtract(double x, double y) {
  return x - y;
}

double multiply(double x, double y) {
  return x * y;
}

dynamic divide(double x, double y) {
  if (y == 0) {
    return "Error! Division by zero";
  }
  return x / y;
}

double getNumber(String prompt) {
  while (true) {
    print(prompt);
    try {
      return double.parse(stdin.readLineSync() ?? "0");
    } catch (e) {
      print("Invalid number");
    }
  }
}

void main() {
  double? firstNumber;
  double? secondNumber;

  while (true) {
    print("\nOptions:");
    print("Enter '1' to add two numbers");
    print("Enter '2' to subtract two numbers");
    print("Enter '3' to multiply two numbers");
    print("Enter '4' to divide two numbers");
    print("Enter 'quit' to exit the program");
    String userInput = stdin.readLineSync() ?? "";

    if (userInput == "quit") {
      break;
    } else if (userInput == '1' || userInput == '2' || userInput == '3' || userInput == '4') {
      if (firstNumber == null) {
        firstNumber = getNumber("Enter the first number: ");
      }
      if (secondNumber == null) {
        secondNumber = getNumber("Enter the second number: ");
      }

      var result;
      if (userInput == "1") {
        result = add(firstNumber, secondNumber);
      } else if (userInput == "2") {
        result = subtract(firstNumber, secondNumber);
      } else if (userInput == "3") {
        result = multiply(firstNumber, secondNumber);
      } else if (userInput == "4") {
        result = divide(firstNumber, secondNumber);
      }

      print("The result will be $result");

      firstNumber = null;
      secondNumber = null;
    } else {
      print("Unknown input. Please try again");
    }

    print("Do you want to perform another calculation? type(yes/no): ");
    String anotherCalculation = stdin.readLineSync()?.toLowerCase() ?? "";
    if (anotherCalculation != 'yes' && anotherCalculation != 'y') {
      break;
    }
  }
}
