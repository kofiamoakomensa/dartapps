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

String divide(double x, double y) {
  if (y == 0) {
    return "Error! Division by zero";
  }
  return (x / y).toString();
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
      bool validInput = false;
      
      while (!validInput) {
        try {
          print("Enter first number: ");
          firstNumber = double.parse(stdin.readLineSync() ?? "0");
          print("Enter second number: ");
          secondNumber = double.parse(stdin.readLineSync() ?? "0");
          validInput = true;
        } catch (e) {
          print("Invalid number, please try again");
        }
      }

      if (userInput == "add") {
        print("The result will be ${add(firstNumber, secondNumber)}");
      } else if (userInput == "subtract") {
        print("The result will be ${subtract(firstNumber, secondNumber)}");
      } else if (userInput == "divide") {
        print("The result will be ${divide(firstNumber, secondNumber)}");
      } else if (userInput == "multiply") {
        print("The result will be ${multiply(firstNumber, secondNumber)}");
      }
    } else {
      print("Unknown input");
    }
  }
}
