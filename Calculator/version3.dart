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

void main() {
  while (true) {
    print("\nOptions:");
    print("Enter 'add' to add two numbers");
    print("Enter 'subtract' to subtract two numbers");
    print("Enter 'multiply' to multiply two numbers");
    print("Enter 'divide' to divide two numbers");
    print("Enter 'quit' to exit the program");

    String userInput = stdin.readLineSync() ?? "";

    if (userInput == "quit") {
      break;
    } else if (userInput == 'add' || userInput == 'subtract' || userInput == 'multiply' || userInput == 'divide') {
      double firstNumber = 0;
      double secondNumber = 0;

      while (true) {
        try {
          print("Enter first number: ");
          firstNumber = double.parse(stdin.readLineSync() ?? "0");
          break;
        } catch (e) {
          print("Invalid Input. Please enter a valid first number");
        }
      }

      while (true) {
        try {
          print("Enter second number: ");
          secondNumber = double.parse(stdin.readLineSync() ?? "0");
          break;
        } catch (e) {
          print("Invalid Input. Please enter a valid second number");
        }
      }

      var result;
      if (userInput == "add") {
        result = add(firstNumber, secondNumber);
      } else if (userInput == "subtract") {
        result = subtract(firstNumber, secondNumber);
      } else if (userInput == "multiply") {
        result = multiply(firstNumber, secondNumber);
      } else if (userInput == "divide") {
        result = divide(firstNumber, secondNumber);
      }

      print("The result will be $result");

      print("Do you want to perform another calculation? (yes/no): ");
      String anotherCalculation = stdin.readLineSync()?.toLowerCase() ?? "";
      if (anotherCalculation != 'yes' && anotherCalculation != 'y') {
        break;
      }
    } else {
      print("Unknown input. Please try again");
    }
  }
}