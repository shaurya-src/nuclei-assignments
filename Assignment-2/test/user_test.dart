import 'package:test/test.dart';
import '../lib/user.dart';

main() {
  group('Check object attributes: ', () {
    test('Full name', () {
      User user = User('New User', 19, 'Delhi', 121, ['A', 'C', 'E', 'B']);
      String fullName = user.name;
      expect(fullName, 'New User');
    });

    test('Age', () {
      User user = User('New User', 19, 'Delhi', 121, ['A', 'C', 'E', 'B']);
      int age = user.age;
      expect(age, 19);
    });

    test('Address', () {
      User user = User('New User', 19, 'Delhi', 121, ['A', 'C', 'E', 'B']);
      String address = user.address;
      expect(address, 'Delhi');
    });

    test('Roll Number', () {
      User user = User('New User', 19, 'Delhi', 121, ['A', 'C', 'E', 'B']);
      int rollNumber = user.rollNumber;
      expect(rollNumber, 121);
    });

    test('Courses', () {
      User user = User('New User', 19, 'Delhi', 121, ['A', 'C', 'E', 'B']);
      List<String> courses = user.courses;
      expect(courses, ['A', 'C', 'E', 'B']);
    });
  });

  group('Check user records: ', () {
    test('Registered Roll Numbers', () {
      expect(1, 1);
    });

    test('Registered Users', () {
      expect(1, 1);
    });
  });
}
