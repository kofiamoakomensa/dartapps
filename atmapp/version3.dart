import 'dart:io';

class ATM {
  double balance;
  String? fullName;
  String? password;

  ATM() : balance = 0;

  void setupAccount(String fullName, String password) {
    this.fullName = fullName;
    this.password = password;
    print("Account created for $fullName.");
  }

  bool checkCredentials(String fullName, String password) {
    return this.fullName == fullName && this.password == password;
  }

  void checkBalance() {
    print("Your current balance is: \$$balance");
  }

  void deposit() {
    print("Enter amount to deposit: ");
    double amount = double.parse(stdin.readLineSync()!);
    balance += amount;
    print("\$$amount deposited successfully.");
  }

  void withdraw() {
    print("Enter amount to withdraw: ");
    double amount = double.parse(stdin.readLineSync()!);
    if (amount > balance) {
      print("Insufficient balance.");
    } else {
      balance -= amount;
      print("\$$amount withdrawn successfully.");
      print("Here is your updated balance:");
      checkBalance();
    }
  }
}

void main() {
  ATM atm = ATM();
  print("Welcome to the ATM");
  print("Enter your full name for account setup: ");
  String fullName = stdin.readLineSync()!;
  print("Create a password for your account: ");
  String password = stdin.readLineSync()!;
  atm.setupAccount(fullName, password);

  // Sign in process
  while (true) {
    print("\nPlease sign in to your account.");
    print("Enter your fullname: ");
    String signInName = stdin.readLineSync()!;
    print("Enter your password: ");
    String signInPassword = stdin.readLineSync()!;
    if (atm.checkCredentials(signInName, signInPassword)) {
      break;
    } else {
      print("Invalid credentials. Please try again.");
    }
  }

  while (true) {
    print("\nATM Menu");
    print("1 - Check Balance");
    print("2 - Deposit");
    print("3 - Withdraw");
    print("4 - Exit");

    print("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        atm.checkBalance();
        break;
      case '2':
        atm.deposit();
        break;
      case '3':
        atm.withdraw();
        break;
      case '4':
        print("Thank you for using the ATM.");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
