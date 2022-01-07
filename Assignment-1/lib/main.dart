import 'dart:io';
import 'item.dart';

// helper function to throw exception when value is less than or equal to zero
void isGreaterThanZero(num val) {
  if (val <= 0) {
    throw Exception("Value must be greater than zero.");
  }
}

// helper function to check if given string is a number
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

void main() {
  // Continue taking inputs as long as user enters y/Y when asked.

  do {
    // ############################################

    double? itemPrice;
    int? itemQuantity;
    var itemType;
    bool errorFlag = false;

    stdout.write("Enter the item name:\t");
    String itemName = stdin.readLineSync().toString();
    try {
      if (itemName.isEmpty) {
        throw Exception("Item name not found!");
      }

      if (isNumeric(itemName)) {
        throw Exception("Numeric value not allowed for item name!");
      }
    } catch (error) {
      print("$error");
      errorFlag = true;
    }

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

    stdout.write("Select the item type (1. raw | 2. manufactured | 3. imported):\t");
    try {
      int typeChoice = int.parse(stdin.readLineSync().toString());
      itemType = ItemType.values[typeChoice - 1];
    } catch (error) {
      print("Error: Choose item type from {1, 2, or 3}");
      print("$error");
      errorFlag = true;
    }

    // ############################################

    // Check if any error occcured while taking input
    if (!errorFlag) {
      // Initialize item when no error is encounterd
      Item test = Item(itemName, price: itemPrice ?? 0.0, quantity: itemQuantity ?? 0, type: itemType);

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
