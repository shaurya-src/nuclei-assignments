enum ItemType { raw, manufactured, imported }

class Item {
  // Define attributes of the Item Class
  final String name;
  final double price;
  final int quantity;
  final ItemType type;

  /* 
  Constructor to initialize the object
  name is a mandatory positional argument
  price, quantity, type are named args
  out of these three, only type is mandatory
  */
  Item(this.name, {this.price = 0, this.quantity = 1, required this.type});

  // define late variables to store tax and final price
  late double _salesTax = calculateSalesTax();
  late double _finalPrice = getFinalPrice();

  // Function to calculate sales tax according to item type
  calculateSalesTax() {}

  // Function to get the final price (sales tax + item price)
  double getFinalPrice() {
    return _salesTax + price;
  }

  // function to calculate total price of all entities of the item
  double getAmountOfAllItems() {
    return _finalPrice * quantity;
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
    print("Sales Tax liability (per item): $_salesTax \n");
  }

  // Function to get the final details of the item
  void showFinalDetails() {
    print('''
    >>>>>>>>>><<<<<<<<<<
    Final Details:
    
    Item Name - $name
    Item Price - $price
    Sales Tax - $_salesTax
    Final Price - $_finalPrice

    >>>>>>>>>><<<<<<<<<<
    ''');
  }
}

// Child class for Raw items
class Raw extends Item {
  Raw(String name, double price, int quantity, ItemType type) : super(name, price: price, quantity: quantity, type: type);

  @override
  double calculateSalesTax() {
    return 0.125 * price;
  }
}

//Child class for Manufactured items
class Manufactured extends Item {
  Manufactured(String name, double price, int quantity, ItemType type) : super(name, price: price, quantity: quantity, type: type);

  @override
  double calculateSalesTax() {
    double _baseTax = 0.125 * price;
    return _baseTax + (0.02 * 1.125 * price);
  }
}

// Child class for Imported items
class Imported extends Item {
  Imported(String name, double price, int quantity, ItemType type) : super(name, price: price, quantity: quantity, type: type);

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