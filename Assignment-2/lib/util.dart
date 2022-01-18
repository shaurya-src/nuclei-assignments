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
    for (User user in User.registeredUsers) {
      if (user.rollNumber == rollNumber) {
        return true;
      }
    }
    return false;
  }

  // Function to check if given string is numeric
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  // Function to check if number is greater than zero
  static bool isGreaterThanZero(num number) {
    return number > 0;
  }

  // Validate user's Full Name
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

  // Validate user's age
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

  // Validate user's address
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

  // Validate user's roll number
  static int? inputRollNumber() {
    int? rollNumber;
    bool error = false;

    do {
      stdout.write("Enter the roll number:   ");
      try {
        error = false;
        String rollNumberString = stdin.readLineSync().toString();
        // Check for string or null input
        if (int.tryParse(rollNumberString) == null || rollNumberString.isEmpty) {
          error = true;
          throw Exception("Invalid Roll Number. Please try again!");
        } else {
          rollNumber = int.parse(rollNumberString);
          if (Util.isGreaterThanZero(rollNumber)) {
            if (Util.isRollNumberAlreadyPresent(rollNumber)) {
              error = true;
              throw Exception("Roll number already present! Please try again.");
            }
          } else {
            error = true;
            throw Exception("Roll number must be greater than zero.");
          }
        }
      } catch (exception) {
        print(exception);
      }
    } while (error);

    return rollNumber;
  }

  // Validate user's courses
  static List<String>? inputCourses() {
    List<String>? courses;
    bool error = false;

    do {
      stdout.write("Enter the courses (seperated by ','):   ");
      String coursesString = stdin.readLineSync().toString();
      try {
        error = false;
        // Check for empty and numeric strings
        if (coursesString.isEmpty || Util.isNumeric(coursesString)) {
          error = true;
          throw Exception("Invalid courses. Please try again.");
        } else {
          courses = coursesString.split(',');

          if (courses.length < 4) {
            error = true;
            throw Exception("Please select atleast 4 courses.");
          }

          // Convert all elements to uppercase
          courses = courses.map((course) => course.trim().toUpperCase()).toList();

          // Verify if all the courses are valid
          if (!Util.verifyCourses(courses)) {
            error = true;
            throw Exception("Invalid course(s) selected. Please choose from ['A', 'B', 'C', 'D', 'E', 'F'].");
          }
        }
      } catch (exception) {
        print(exception);
      }
    } while (error);

    return courses;
  }

  static Encrypter getEncrypter() {
    final key = Key.fromLength(32);

    return Encrypter(AES(key));
  }
}
