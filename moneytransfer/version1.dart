import 'dart:io';

class MoneyTransferApp {
  Map<String, Map<String, dynamic>> users;

  MoneyTransferApp() : users = {};

  bool registerUser(String username, String password) {
    if (users.containsKey(username)) {
      print("Username already exists.");
      return false;
    }
    users[username] = {"password": password, "balance": 0};
    print("User $username registered successfully.");
    return true;
  }

  String? login(String username, String password) {
    var user = users[username];
    if (user == null || user['password'] != password) {
      print("Invalid username or password.");
      return null;
    }
    return username;
  }

  void deposit(String username, double amount) {
    users[username]!['balance'] += amount;
    print("Deposited \$$amount. Total balance is now \${users[username]!['balance']}.");
  }

  bool transfer(String sender, String receiver, double amount) {
    if (!users.containsKey(receiver)) {
      print("Receiver does not exist.");
      return false;
    }
    if (users[sender]!['balance'] < amount) {
      print("Insufficient balance.");
      return false;
    }
    users[sender]!['balance'] -= amount;
    users[receiver]!['balance'] += amount;
    print("Transferred \$$amount to $receiver. Your new balance is \${users[sender]!['balance']}.");
    return true;
  }

  void checkBalance(String username) {
    print("Your balance is \${users[username]!['balance']}.");
  }
}

void main() {
  var app = MoneyTransferApp();
  String? currentUser;

  while (true) {
    if (currentUser == null) {
      print("\nMoney Transfer App");
      print("1. Register");
      print("2. Login");
      print("3. Exit");
      print("Enter your choice: ");
      String choice = stdin.readLineSync()!;

      if (choice == '1') {
        print("Enter a new username: ");
        String username = stdin.readLineSync()!;
        print("Enter a new password: ");
        String password = stdin.readLineSync()!;
        app.registerUser(username, password);
      } else if (choice == '2') {
        print("Enter your username: ");
        String username = stdin.readLineSync()!;
        print("Enter your password: ");
        String password = stdin.readLineSync()!;
        currentUser = app.login(username, password);
      } else if (choice == '3') {
        break;
      }
    } else {
      print("\n1. Deposit Money");
      print("2. Transfer Money");
      print("3. Check Balance");
      print("4. Logout");
      print("Enter your choice: ");
      String choice = stdin.readLineSync()!;

      if (choice == '1') {
        print("Enter amount to deposit: ");
        double amount = double.parse(stdin.readLineSync()!);
        app.deposit(currentUser, amount);
      } else if (choice == '2') {
        print("Enter receiver's username: ");
        String receiver = stdin.readLineSync()!;
        print("Enter amount to transfer: ");
        double amount = double.parse(stdin.readLineSync()!);
        app.transfer(currentUser, receiver, amount);
      } else if (choice == '3') {
        app.checkBalance(currentUser);
      } else if (choice == '4') {
        currentUser = null;
      }
    }
  }
}
