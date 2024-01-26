import 'dart:io';

class ATM {
  double balance;

  ATM() : balance = 0;

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
      print("Here is your updated balance: ");
      checkBalance();
    }
  }
}

void main() {
  ATM atm = ATM();
  while (true) {
    print("\nATM");
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
