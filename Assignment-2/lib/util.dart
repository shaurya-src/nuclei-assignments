import 'user.dart';
import 'dart:io';

class Util {
  // Function to check if selected courses are valid
  static bool verifyCourses(List<String> courses) {
    List<String> allowed = ["A", "B", "C", "D", "E", "F"];
    for (String course in courses) {
      if (!allowed.contains(course)) {
        return false;
      } else {
        allowed.remove(course);
      }
    }
    return true;
  }

  // Function to check if roll number already exists
  static bool isRollNumberAlreadyPresent(int rollNumber) {
    return User.registeredRollNumbers.contains(rollNumber);
  }

  // Function to check if given string is numeric
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  // Function to check if number is greater than zero
  static bool isGreaterThanZero(num number) {
    return number > 0;
  }

  // Input user's Full Name
  static String inputName() {
    String name;
    bool _error = false;

    do {
      stdout.write("Enter the full name:   ");
      name = stdin.readLineSync().toString();
      try {
        _error = false;
        if (Util.isNumeric(name) || name.isEmpty) {
          _error = true;
          throw Exception("Invalid name. Please try again!");
        }
      } catch (exception) {
        print(exception);
      }
    } while (_error);

    return name;
  }

  // Input user's age
  static int? inputAge() {
    int? age;
    bool error = false;

    do {
      stdout.write("Enter the age:   ");
      try {
        error = false;
        String ageString = stdin.readLineSync().toString();
        // Check for string or null input
        if (int.tryParse(ageString) == null || ageString.isEmpty) {
          error = true;
          throw Exception("Invalid age. Please try again!");
        } else {
          age = int.parse(ageString);
          if (!Util.isGreaterThanZero(age)) {
            error = true;
            throw Exception("Age must be greater than zero.");
          }
        }
      } catch (exception) {
        print(exception);
      }
    } while (error);

    return age;
  }

  // Input user's address
  static String inputAddress() {
    String address;
    bool error = false;

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

    return address;
  }
}
