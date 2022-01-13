import '../item.dart';

// Child class for Imported items
class Imported extends Item {
  Imported(String name, double price, int quantity) : super(name, price: price, quantity: quantity);

  @override
  double calculateSalesTax() {
    double _importDuty = 0.1 * price;
    double _baseTax = 0.125 * price;
    double _lumpSumAmount = price + _importDuty + _baseTax;

    var _surcharge;

    // [<= not working in else if statement]
    if (_lumpSumAmount <= 100) {
      _surcharge = 5;
    } else if (100 < _lumpSumAmount && _lumpSumAmount <= 200) {
      _surcharge = 10;
    } else {
      _surcharge = 0.05 * _lumpSumAmount;
    }

    return _baseTax + _importDuty + _surcharge;
  }
}
