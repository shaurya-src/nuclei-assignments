import '../item.dart';

// Child class for Raw items
class Raw extends Item {
  Raw(String name, double price, int quantity) : super(name, price: price, quantity: quantity);

  @override
  double calculateSalesTax() {
    return 0.125 * price;
  }
}
