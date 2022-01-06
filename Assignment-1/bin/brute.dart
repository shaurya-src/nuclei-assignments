import 'dart:io';

class Item {
  String? name;
  double? price;
  int? quantity;
  String? type;

  Item(String name, {double? price, int? quantity, required String type}) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.type = type;
  }

  void showDetails() {
    print("Name: $name; Price: $price; Quantity: $quantity; Type: $type");
  }

  double calculateSalesTax() {
    double totalTax = -1;

    switch (this.type) {
      case "raw":
        totalTax = 0.125 * (this.price ?? 0);
        break;

      case "manufactured":
        double baseTax = 0.125 * (this.price ?? 0);
        totalTax = baseTax + (0.02 * 1.125 * (this.price ?? 0));
        break;

      case "imported":
        double importDuty = 0.1 * (this.price ?? 0);
        double baseTax = 0.125 * (this.price ?? 0);
        double finalAmount = (this.price ?? 0) + importDuty + baseTax;

        var surcharge;

        // <= not working in else if statement
        if (finalAmount <= 100) {
          surcharge = 5;
        } else if (100 < finalAmount && finalAmount <= 200) {
          surcharge = 10;
        } else {
          surcharge = 0.05 * finalAmount;
        }

        totalTax = baseTax + importDuty + surcharge;
        break;

      default:
        print("Unknown Type!");
        break;
    }
    return totalTax;
  }

  void showPriceDetails() {
    var salesTax = this.calculateSalesTax();
    var finalPrice = salesTax + (this.price ?? 0);
    print("Sales tax liability per item: $salesTax");
    print("Final Price: $finalPrice");
  }
}

void main() {
  do {
    print("Enter the item name: ");
    String itemName = stdin.readLineSync().toString();

    double? itemPrice;
    int? itemQuantity;

    print("Enter the item price: ");
    itemPrice = double.parse(stdin.readLineSync().toString());

    print("Enter the item quantity: ");
    itemQuantity = int.parse(stdin.readLineSync().toString());

    print("Enter the item type (raw/manufactured/imported): ");
    late String itemType = stdin.readLineSync().toString();

    Item test = Item(itemName,
        price: itemPrice, quantity: itemQuantity, type: itemType);

    test.showDetails();
    var salesTax = test.calculateSalesTax();
    print("Sales tax is: $salesTax");

    print("Do you want to enter details of any other item (y/n):");
  } while (stdin.readLineSync().toString() == 'y');
}
