import 'user.dart';

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
}
