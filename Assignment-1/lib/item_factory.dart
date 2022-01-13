import 'item.dart';
import 'items/raw.dart';
import 'items/manufactured.dart';
import 'items/imported.dart';

class ItemFactory {
  // function to use factory design
  static Item factoryClass(String name, double price, int quantity, ItemType type) {
    switch (type) {
      case ItemType.raw:
        return Raw(name, price, quantity);
      case ItemType.manufactured:
        return Manufactured(name, price, quantity);
      case ItemType.imported:
        return Imported(name, price, quantity);
      default:
        throw Exception("Invalid Item Type encountered!");
    }
  }
}
