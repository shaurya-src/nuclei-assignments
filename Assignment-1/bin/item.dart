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

      // Tax calculation for RAW items
      case "raw":
        totalTax = 0.125 * price;
        break;

      // Tax calculation for MANUFACTURED items
      case "manufactured":
        double baseTax = 0.125 * price;
        totalTax = baseTax + (0.02 * 1.125 * price);
        break;

      // Tax calculation for IMPORTED items
      case "imported":
        double importDuty = 0.1 * price;
        //
        // not clear in the question
        //
        double baseTax = 0.125 * price;
        double lumpSumAmount = price + importDuty + baseTax;

        var surcharge;

        // [<= not working in else if statement]
        if (lumpSumAmount <= 100) {
          surcharge = 5;
        } else if (100 < lumpSumAmount && lumpSumAmount <= 200) {
          surcharge = 10;
        } else {
          surcharge = 0.05 * lumpSumAmount;
        }

        totalTax = baseTax + importDuty + surcharge;
        break;

      // Invalid item encountered
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
