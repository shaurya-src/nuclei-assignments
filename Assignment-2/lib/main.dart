import 'dart:io';
import 'user.dart';
import 'util.dart';

void addUser() {
  String name;
  int? age;
  String address;
  int? rollNumber;
  List<String>? courses;
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

  // Input user's courses
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

  // Make user object from the input data
  User(name, age ?? 0, address, rollNumber ?? 0, courses ?? []);
}

void displayUser() {
  int orderChoice;
  bool error = false;

  // Take a valid input for choice
  do {
    error = false;
    print("\nSelect the order: ");
    print("1. Ascending");
    print("2. Descending");
    stdout.write("Enter your choice:  ");
    try {
      orderChoice = int.parse(stdin.readLineSync().toString());
      switch (orderChoice) {
        case 1:
          User.showAllUsersInAscending();
          break;
        case 2:
          User.showAllUsersInDescending();
          break;
        default:
          throw Exception("Invalid choice encountered!");
      }
    } catch (exception) {
      error = true;
      print("Invalid choice. Please try again.");
    }
  } while (error);
}

void deleteUser() {
  int rollNumberToDelete;
  stdout.write("\nEnter the Roll Number of user to delte:   ");
  try {
    rollNumberToDelete = int.parse(stdin.readLineSync().toString());
    if (User.deleteUser(rollNumberToDelete)) {
      print("User with Roll Number \"$rollNumberToDelete\" deleted!");
    } else {
      throw Exception("Failed to delete user.");
    }
  } catch (exception) {
    print("Invalid Roll Number. Please try again!");
  }
}

void saveUser() {
  print("yo");
}

void main() {
  bool noExit = true;
  do {
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
          displayUser();
          break;
        case 3:
          deleteUser();
          break;
        case 4:
          break;
        case 5:
          noExit = false;
          break;
        default:
          throw Exception("Invalid choice! Select from - [1, 2, 3, 4, 5].");
      }
    } catch (error) {
      print("$error");
    }
  } while (noExit);
}
