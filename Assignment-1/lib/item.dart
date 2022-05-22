class Item {
  // Define attributes of the Item Class
  final String name;
  final double price;
  final int quantity;

  /* 
  Constructor to initialize the object
  name is a mandatory positional argument
  price, quantity, type are named args
  out of these three, only type is mandatory
  */
  Item(this.name, {this.price = 0, this.quantity = 1});

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
