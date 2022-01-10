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
    if (User.users.containsKey(rollNumber)) {
      throw Exception("Roll number already present! Please try again.");
    }
    return true;
  }
}
