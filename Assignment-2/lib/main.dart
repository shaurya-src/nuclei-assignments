import 'dart:io';
import 'user.dart';
import 'util.dart';

void addUser() {
  String name;
  int? age;
  String address;
  int? rollNumber;
  String coursesString;
  bool error = false;

  // Input user's Full Name
  do {
    stdout.write("Enter the full name:   ");
    name = stdin.readLineSync().toString();
    try {
      error = false;
      if (Util.isNumeric(name) || name.isEmpty) {
        error = true;
        throw Exception("Invalid name. Please try again!");
      }
    } catch (exception) {
      print(exception);
    }
  } while (error);

  // Input user's Age
  do {
    stdout.write("Enter the age:   ");
    try {
      error = false;
      String ageString = stdin.readLineSync().toString();
      if (int.tryParse(ageString) == null || ageString.isEmpty) {
        error = true;
        throw Exception("Invalid age. Please try again!");
      } else {
        age = int.parse(ageString);
        if (Util.isGreaterThanZero(age) != true) {
          error = true;
        }
      }
    } catch (exception) {
      print(exception);
    }
  } while (error);

  // Input user's Address
  do {
    stdout.write("Enter the address:   ");
    address = stdin.readLineSync().toString();
    try {
      error = false;
      if (Util.isNumeric(address) || address.isEmpty) {
        error = true;
        throw Exception("Invalid address. Please try again!");
      }
    } catch (exception) {
      print(exception);
    }
  } while (error);

  // Input user's Roll Number
  do {
    stdout.write("Enter the roll number:   ");
    try {
      error = false;
      String rollNumberString = stdin.readLineSync().toString();
      if (int.tryParse(rollNumberString) == null || rollNumberString.isEmpty) {
        error = true;
        throw Exception("Invalid Roll Number. Please try again!");
      } else {
        rollNumber = int.parse(rollNumberString);
      }
      Util.isRollNumberAlreadyPresent(rollNumber);
    } catch (exception) {
      print(exception);
    }
  } while (error);

  // Input user's courses
  // do {
  //   stdout.write("Enter the courses:   ");
  // } while (error);

  User test = User(name, age ?? 0, address, rollNumber ?? 0, ['A', 'B', 'C', 'D']);
}

void displayUser() {
  print("yo");
}

void deleteUser() {
  print("yo");
}

void saveUser() {
  print("yo");
}

void main() {
  print('''

Please select an option:

1. Add User details
2. Display User details
3. Delete User details
4. Save User details
5. Exit

''');

  stdout.write("Enter your choice:  ");

  try {
    int choice = int.parse(stdin.readLineSync().toString());

    switch (choice) {
      case 1:
        addUser();
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      default:
        throw Exception("Invalid choice! Select from - [1, 2, 3, 4, 5].");
    }
  } catch (error) {
    print("$error");
  }

  // var test = User("Amit", 12, "Chennai", 17, ["A", "B", "E", "F"]);
  // var test1 = User("Rahul", 26, "Mumbai", 19, ["B", "E", "F", "D", "C"]);
  // var test2 = User("Max", 19, "Delhi", 12, ["E", "F", "A", "B"]);
  // var test3 = User("Zyan", 19, "Delhi", 12, ["E", "F", "A", "B"]);
  // var test4 = User("Aam", 19, "Delhi", 17, ["E", "F", "A", "B"]);
  // var test5 = User("Aam", 19, "Delhi", 13, ["E", "F", "A", "B"]);

  // try {
  //   Util.verifyCourses(test.courses);
  //   test.showUserDetails();
  // } catch (error) {
  //   print(error);
  // }

  // print(User.users);
  // print(User.users[1].name);
  for (User user in User.registeredUsers) {
    user.showUserDetails();
  }
}
