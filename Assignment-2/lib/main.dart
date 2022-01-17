import 'dart:io';
import 'user.dart';
import 'util.dart';
import 'dart:convert';
import 'dart:async';

void addUser() {
  String name;
  int? age;
  String address;
  int? rollNumber;
  List<String>? courses;
  bool error = false;

  name = Util.inputName();
  age = Util.inputAge();
  address = Util.inputAddress();

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

Future<void> loadUsers() async {
  // Function to load all the Users from memory
  final file = File('assets/user_data.txt');
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      if (!line.isEmpty) {
        final json = jsonDecode(line);
        User user = User.fromJson(json);
        User.registeredUsers.add(user);
        User.registeredRollNumbers.add(user.rollNumber);
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}

void saveUsers() {
  // Function to save Users to memory
  File outputFile = File('assets/user_data.txt');
  try {
    outputFile.createSync();
    for (User user in User.registeredUsers) {
      String json = jsonEncode(user);
      outputFile.writeAsStringSync(json, mode: FileMode.append);
      outputFile.writeAsStringSync("\n", mode: FileMode.append);
    }
    print("Saved all users successfully!");
  } catch (exception) {
    print(exception);
  }
}

void main() async {
  bool noExit = true;

  // Load users from memory
  await loadUsers();

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
          saveUsers();
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
