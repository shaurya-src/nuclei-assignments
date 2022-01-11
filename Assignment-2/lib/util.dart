import 'user.dart';

class Util {
  // Function to check if selected courses are valid
  static bool verifyCourses(List<String> courses) {
    List<String> allowed = ["A", "B", "C", "D", "E", "F"];
    if (courses.length >= 4) {
      for (String course in courses) {
        if (!allowed.contains(course)) {
          throw Exception("Invalid course(s) selected. Please choose from $allowed.");
        }
      }
    } else {
      throw Exception("Please select atleast 4 courses.");
    }
    return true;
  }

  // Function to check if roll number already exists
  static bool isRollNumberAlreadyPresent(int rollNumber) {
    if (User.registeredRollNumbers.contains(rollNumber)) {
      throw Exception("Roll number already present! Please try again.");
    }
    return true;
  }

  // Function to check if given string is numeric
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  // Function to check if number is greater than zero
  static bool isGreaterThanZero(num number) {
    if (number <= 0) {
      throw Exception("Value must be greater than zero!");
    }
    return true;
  }
}
