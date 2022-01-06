import 'dart:io';

class Item {
  String? name;
  double? price;
  int? quantity;
  String? type;

  Item(String name, double price, int quantity, String type) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.type = type;
  }

  void showDetails() {
    print("Name: $name; Price: $price; Quantity: $quantity; Type: $type");
  }
}

void main() {
  do {
    print("Enter the item name: ");
    String itemName = stdin.readLineSync().toString();
    print("Enter the item price: ");
    double? itemPrice = double.parse(stdin.readLineSync().toString());
    print("Enter the item quantity: ");
    int? itemQuantity = int.parse(stdin.readLineSync().toString());
    print("Enter the item type (raw/manufactured/imported): ");
    late String itemType = stdin.readLineSync().toString();

    Item test = Item(itemName, itemPrice, itemQuantity, itemType);

    test.showDetails();

    print("Do you want to enter details of any other item (y/n):");
  } while (stdin.readLineSync().toString() == 'y');
}
