import 'dart:io';

class Item {
  // Define attributes of the Item Class
  String name;
  double price;
  int quantity;
  String type;

  /* 
  Constructor to initialize the object
  name is a mandatory positional argument
  price, quantity, type are named args
  out of these three, only type is mandatory
  */
  Item(this.name, {this.price = 0, this.quantity = 1, required this.type});

  // define late variables to store tax and final price
  late double salesTax = calculateSalesTax();
  late double finalPrice = getFinalPrice();

  // Function to calculate sales tax according to item type
  double calculateSalesTax() {
    double totalTax = -1;

    switch (this.type) {
      case "raw":
        totalTax = 10;
        break;
      case "manufactured":
        totalTax = 50;
        break;
      case "imported":
        totalTax = 100;
        break;
      default:
        throw Exception("Invalid Item Type");
    }

    return totalTax;
  }

  // Function to get the final price (sales tax + item price)
  double getFinalPrice() {
    return salesTax + price;
  }

  // function to calculate total price of all entities of the item
  double getAmountOfAllItems() {
    return finalPrice * quantity;
  }

  // Function to show provided details of the item
  void showItemDetails() {
    print("""
    ____________________

    Name: $name
    Price: $price
    Quantity: $quantity
    Type: $type
    ____________________
    """);
  }

  // Function to show the calculated tax per item
  void showTaxDetails() {
    print("Sales Tax liability (per item): $salesTax \n");
  }

  // Function to get the final details of the item
  void showFinalDetails() {
    print('''
    >>>>>>>>>><<<<<<<<<<
    Final Details:
    
    Item Name - $name
    Item Price - $price
    Sales Tax - $salesTax
    Final Price - $finalPrice

    >>>>>>>>>><<<<<<<<<<
    ''');
  }
}

// helper function to throw exception when value is less than or equal to zero
void isGreaterThanZero(num val) {
  if (val <= 0) {
    throw Exception("Value must be greater than or equal to zero.");
  }
}

void main() {
  List<String> possibleTypes = ["raw", "manufactured", "imported"];

  // Continue taking inputs as long as user enters y/Y when asked.

  do {
    // ############################################

    stdout.write("Enter the item name:\t");
    String itemName = stdin.readLineSync().toString();

    double itemPrice = -1;
    int itemQuantity = -1;
    bool errorFlag = false;

    stdout.write("Enter the item price:\t");
    try {
      itemPrice = double.parse(stdin.readLineSync().toString());
      isGreaterThanZero(itemPrice);
    } catch (error) {
      // if we provide other data type or a negative value
      print("ItemPrice - $error");
      errorFlag = true;
    }

    stdout.write("Enter the item quantity:\t");
    try {
      itemQuantity = int.parse(stdin.readLineSync().toString());
      isGreaterThanZero(itemQuantity);
    } catch (error) {
      print("ItemQuantity - $error");
      errorFlag = true;
    }

    stdout.write("Enter the item type (raw/manufactured/imported):\t");
    String itemType = stdin.readLineSync().toString().toLowerCase();
    try {
      if (!possibleTypes.contains(itemType)) {
        throw Exception("Invalid Item Type.");
      }
    } catch (error) {
      print("Invalid Item Type.");
      errorFlag = true;
    }

    // ############################################

    // Check if any error occcured while taking input
    if (!errorFlag) {
      // Initialize item when no error is encounterd
      Item test = Item(itemName, price: itemPrice, quantity: itemQuantity, type: itemType);

      // Check different outputs for debugging
      test.showItemDetails();
      test.showTaxDetails();

      // Output the required details
      test.showFinalDetails();
    } else {
      // If error encountered, warn the user and promt to try again.
      print("Error occured! Please try again.");
    }

    stdout.write("Do you want to enter details of any other item (y/n):\t");
  } while (stdin.readLineSync().toString().toLowerCase() == 'y');
}
