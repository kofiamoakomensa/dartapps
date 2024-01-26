import 'dart:io';

Map<String, Map<String, dynamic>> users = {
  "user1": {"name": "Alice", "balance": 1000},
  "user2": {"name": "Bob", "balance": 500},
};

Map<String, Map<String, dynamic>> shops = {
  "shop1": {"name": "GadgetStore", "balance": 0, "transactions": []},
  "shop2": {"name": "BookWorld", "balance": 0, "transactions": []},
};

String transferMoney(String userId, String shopId, double amount) {
  if (!users.containsKey(userId)) {
    return "User not found.";
  }
  if (!shops.containsKey(shopId)) {
    return "Shop not found.";
  }
  if (users[userId]!['balance'] < amount) {
    return "Insufficient balance.";
  }

  users[userId]!['balance'] -= amount;
  shops[shopId]!['balance'] += amount;
  shops[shopId]!['transactions'].add({"name": users[userId]!['name'], "amount": amount});
  return "Transferred \$amount from ${users[userId]!['name']} to ${shops[shopId]!['name']}.";
}

void displayBalances() {
  users.forEach((userId, userInfo) {
    print("${userInfo['name']} balance: ${userInfo['balance']}");
  });
  shops.forEach((shopId, shopInfo) {
    print("${shopInfo['name']} balance: ${shopInfo['balance']}");
    for (var transaction in shopInfo['transactions']) {
      print("    ${transaction['name']} transferred ${transaction['amount']}");
    }
  });
}

void main() {
  while (true) {
    print("\nOptions:");
    print("1. Transfer Money");
    print("2. Display Balances");
    print("3. Exit");
    print("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        print("Enter user ID: ");
        String userId = stdin.readLineSync()!;
        print("Enter shop ID: ");
        String shopId = stdin.readLineSync()!;
        print("Enter amount to transfer: ");
        double amount = double.parse(stdin.readLineSync()!);
        print(transferMoney(userId, shopId, amount));
        break;
      case '2':
        displayBalances();
        break;
      case '3':
        return;
      default:
        print("Invalid choice.");
    }
  }
}
