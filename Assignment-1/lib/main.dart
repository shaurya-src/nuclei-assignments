import 'dart:io';
import 'item.dart';
import 'util.dart';

void main() {
  // Continue taking inputs as long as user enters y/Y when asked.

  do {
    // ############################################

    double? itemPrice;
    int? itemQuantity;
    String itemName;
    var itemType;
    bool errorFlag = false;

    do {
      stdout.write("Enter the item name:\t");
      itemName = stdin.readLineSync().toString();
      try {
        errorFlag = false;
        if (itemName.isEmpty) {
          throw Exception("Item name not found!");
        }

        if (Util.isNumeric(itemName)) {
          throw Exception("Numeric value not allowed for item name!");
        }
      } catch (error) {
        print("$error");
        errorFlag = true;
      }
    } while (errorFlag);

    do {
      stdout.write("Enter the item price:\t");
      try {
        errorFlag = false;
        itemPrice = double.parse(stdin.readLineSync().toString());
        Util.isGreaterThanZero(itemPrice);
      } catch (error) {
        // if we provide other data type or a negative value
        print("ItemPrice - $error");
        errorFlag = true;
      }
    } while (errorFlag);

    do {
      stdout.write("Enter the item quantity:\t");
      try {
        errorFlag = false;
        itemQuantity = int.parse(stdin.readLineSync().toString());
        Util.isGreaterThanZero(itemQuantity);
      } catch (error) {
        print("ItemQuantity - $error");
        errorFlag = true;
      }
    } while (errorFlag);

    do {
      stdout.write("Select the item type (1. raw | 2. manufactured | 3. imported):\t");
      try {
        errorFlag = false;
        int typeChoice = int.parse(stdin.readLineSync().toString());
        itemType = ItemType.values[typeChoice - 1];
      } catch (error) {
        print("Error: Choose item type from {1, 2, or 3}");
        print("$error");
        errorFlag = true;
      }
    } while (errorFlag);

    // ############################################

    // Initialize item when no error is encounterd
    switch (itemType) {
      case ItemType.raw:
        Raw test = Raw(itemName, itemPrice ?? 0.0, itemQuantity ?? 0, itemType);
        test.showItemDetails();
        test.showTaxDetails();

        // Output the required details
        test.showFinalDetails();
        break;

      case ItemType.manufactured:
        Manufactured test = Manufactured(itemName, itemPrice ?? 0.0, itemQuantity ?? 0, itemType);
        test.showItemDetails();
        test.showTaxDetails();
        test.showFinalDetails();
        break;
      case ItemType.imported:
        Imported test = Imported(itemName, itemPrice ?? 0.0, itemQuantity ?? 0, itemType);
        test.showItemDetails();
        test.showTaxDetails();
        test.showFinalDetails();
        break;
      default:
        throw Exception("Invalid Item type encountered!");
    }

    // Item test = Item(itemName, price: itemPrice ?? 0.0, quantity: itemQuantity ?? 0, type: itemType);

    stdout.write("Do you want to enter details of any other item (y/n):\t");
  } while (stdin.readLineSync().toString().toLowerCase() == 'y');
}
