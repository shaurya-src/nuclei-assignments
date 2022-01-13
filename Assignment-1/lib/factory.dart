enum ItemType { raw, manufactured, imported }

abstract class Item {
  // String? name;
  // double? price;
  // int? quantity;
  // ItemType? type;

  // factory Item(String name, {double price = 0, int quantity = 1, required ItemType type}) {
  factory Item(ItemType type) {
    switch (type) {
      case ItemType.raw:
        return Raw();
      // case ItemType.manufactured:
      //   return Manufactured();
      // case ItemType.imported:
      //   return Imported();
      default:
        throw Exception("Invalid Item Type!");
    }
  }

  double calculateSalesTax();
}

class Raw implements Item {
  double? price;
  set setPrice(double itemPrice) {
    price = itemPrice;
  }

  @override
  double calculateSalesTax() {
    return 0.125 * (price ?? 0);
  }
}

// class Manufactured implements Item {
//   @override
//   double calculateSalesTax() {
//     double _baseTax = 0.125 * price;
//     return _baseTax + (0.02 * 1.125 * price);
//   }
// }

// class Imported implements Item {
//   @override
//   double calculateSalesTax() {
//     double _importDuty = 0.1 * price;
//     double _baseTax = 0.125 * price;
//     double _lumpSumAmount = price + _importDuty + _baseTax;

//     var _surcharge;

//     // [<= not working in else if statement]
//     if (_lumpSumAmount <= 100) {
//       _surcharge = 5;
//     } else if (100 < _lumpSumAmount && _lumpSumAmount <= 200) {
//       _surcharge = 10;
//     } else {
//       _surcharge = 0.05 * _lumpSumAmount;
//     }

//     return _baseTax + _importDuty + _surcharge;
//   }
// }

void main() {
  final item = Item(ItemType.raw);
  item.setPrice = 100;
  double result = item.calculateSalesTax();
  print(result);
  print(item.runtimeType);
}
