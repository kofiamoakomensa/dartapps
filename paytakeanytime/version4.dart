import 'dart:io';

Map<String, Map<String, dynamic>> users = {
  "user1": {"name": "Alice", "balance": 1000, "transferred": {}, "purchases": []},
  "user2": {"name": "Bob", "balance": 500, "transferred": {}, "purchases": []},
};

Map<String, Map<String, dynamic>> shops = {
  "shop1": {"name": "GadgetStore", "balance": 0, "inventory": {"Gadget1": 100, "Gadget2": 200}},
  "shop2": {"name": "BookWorld", "balance": 0, "inventory": {"Book1": 50, "Book2": 75}},
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
  users[userId]!['transferred'][shopId] = (users[userId]!['transferred'][shopId] ?? 0) + amount;
  return "Transferred \$amount from ${users[userId]!['name']} to ${shops[shopId]!['name']}.";
}

String purchaseItem(String userId, String shopId, String item) {
  if (!users.containsKey(userId)) {
    return "User not found.";
  }
  if (!shops.containsKey(shopId)) {
    return "Shop not found.";
  }
  if (!shops[shopId]!['inventory'].containsKey(item)) {
    return "Item not found.";
  }
  double itemPrice = shops[shopId]!['inventory'][item];
  if ((users[userId]!['transferred'][shopId] ?? 0) < itemPrice) {
    return "Insufficient balance in shop account.";
  }

  users[userId]!['transferred'][shopId] -= itemPrice;
  shops[shopId]!['balance'] -= itemPrice;
  users[userId]!['purchases'].add({"shopId": shopId, "item": item, "price": itemPrice});
  return "${users[userId]!['name']} purchased $item for \$itemPrice from ${shops[shopId]!['name']}.";
}

void displayBalances() {
  users.forEach((userId, userInfo) {
    print("${userInfo['name']} balance: ${userInfo['balance']}, transferred: ${userInfo['transferred']}");
    for (var purchase in userInfo['purchases']) {
      print("    Purchased ${purchase['item']} for \${purchase['price']} from ${shops[purchase['shopId']]!['name']}");
    }
  });
  shops.forEach((shopId, shopInfo) {
    print("${shopInfo['name']} balance: ${shopInfo['balance']}, inventory: ${shopInfo['inventory']}");
  });
}

void main() {
  while (true) {
    print("\nOptions:");
    print("1. Transfer Money");
    print("2. Purchase Item");
    print("3. Display Balances");
    print("4. Exit");
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
        print("Enter user ID: ");
        userId = stdin.readLineSync()!;
        print("Enter shop ID: ");
        shopId = stdin.readLineSync()!;
        print("Enter item to purchase: ");
        String item = stdin.readLineSync()!;
        print(purchaseItem(userId, shopId, item));
        break;
      case '3':
        displayBalances();
        break;
      case '4':
        return;
      default:
        print("Invalid choice.");
    }
  }
}
