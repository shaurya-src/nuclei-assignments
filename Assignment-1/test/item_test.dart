import '../lib/item_factory.dart';
import 'package:test/test.dart';

main() {
  // Group to test attribute values
  group('Item Initialisation', () {
    test('Check name attribute', () {
      final item = ItemFactory.factoryClass('Test Name', 100, 1, ItemType.imported);
      expect(item.name, 'Test Name');
    });

    // test('Check type attribute', () {
    //   final item = ItemFactory.factoryClass('Test', 100, 1, ItemType.imported);
    //   expect(item.type, ItemType.imported);
    // });
    test('Check quantity attribute', () {
      final item = ItemFactory.factoryClass('Test', 100, 87, ItemType.imported);
      expect(item.quantity, 87);
    });
    test('Check price attribute', () {
      final item = ItemFactory.factoryClass('Test', 782, 1, ItemType.imported);
      expect(item.price, 782.00);
    });
  });

  // Group to test calculated sales tax
  group('Sales Tax', () {
    test('Check tax for raw item', () {
      final item = ItemFactory.factoryClass('Test', 100, 2, ItemType.raw);
      double tax = item.calculateSalesTax();
      expect(tax, 12.5);
    });

    test('Check tax for manufactured item', () {
      final item = ItemFactory.factoryClass('Test', 100, 7, ItemType.manufactured);
      double tax = item.calculateSalesTax();
      expect(tax, 14.75);
    });

    test('Check tax for imported item', () {
      final item = ItemFactory.factoryClass('Test', 100, 7, ItemType.imported);
      double tax = item.calculateSalesTax();
      expect(tax, 32.5);
    });
  });

  // Group to test final price
  group('Final Price', () {
    test('Check final price for raw item', () {
      final item = ItemFactory.factoryClass('Test', 100, 7, ItemType.raw);
      double finalPrice = item.getFinalPrice();
      expect(finalPrice, 112.5);
    });

    test('Check final price for manufactured item', () {
      final item = ItemFactory.factoryClass('Test', 100, 7, ItemType.manufactured);
      double finalPrice = item.getFinalPrice();
      expect(finalPrice, 114.75);
    });

    test('Check final price for imported item', () {
      final item = ItemFactory.factoryClass('Test', 100, 7, ItemType.imported);
      double finalPrice = item.getFinalPrice();
      expect(finalPrice, 132.5);
    });
  });

  test('Check amount of all items', () {
    final item = ItemFactory.factoryClass('Test', 500, 7, ItemType.imported);
    double totalAmount = item.getAmountOfAllItems();
    expect(totalAmount, 4501.875);
  });
}
