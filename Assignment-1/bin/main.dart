import 'dart:io';

enum ItemType { raw, manufactured, imported }

abstract class Item {
  double? price;
  factory Item(ItemType type) {
    switch (type) {
      case ItemType.raw:
        return Raw();
      case ItemType.manufactured:
        return Manufactured();
      case ItemType.imported:
        return Imported();
      default:
        return Raw();
    }
  }

  double calculateSalesTax();
}

class Raw implements Item {
  double? price;

  set setPrice(double price) {
    this.price = price;
  }

  double get getPrice {
    return price ?? 0;
  }

  @override
  double calculateSalesTax() {
    double totalTax = -1;
    totalTax = 0.125 * (this.price ?? 0);
    return totalTax;
  }
}

class Manufactured implements Item {
  double? price;

  set setPrice(double price) {
    this.price = price;
  }

  double get getPrice {
    return price ?? 0;
  }

  @override
  double calculateSalesTax() {
    double totalTax = -1;
    double baseTax = 0.125 * (this.price ?? 0);
    totalTax = baseTax + (0.02 * 1.125 * (this.price ?? 0));
    return totalTax;
  }
}

class Imported implements Item {
  double? price;

  set setPrice(double price) {
    this.price = price;
  }

  double get getPrice {
    return price ?? 0;
  }

  @override
  double calculateSalesTax() {
    double totalTax = -1;
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
    return totalTax;
  }
}

void main() {
  double? price = double.parse(stdin.readLineSync().toString());
  var ir = Item(ItemType.raw);
  ir.price = price;
  print(ir.calculateSalesTax());
}
