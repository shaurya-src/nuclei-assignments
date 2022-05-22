import '../item.dart';

//Child class for Manufactured items
class Manufactured extends Item {
  Manufactured(String name, double price, int quantity) : super(name, price: price, quantity: quantity);

  @override
  double calculateSalesTax() {
    double _baseTax = 0.125 * price;
    return _baseTax + (0.02 * 1.125 * price);
  }
}
