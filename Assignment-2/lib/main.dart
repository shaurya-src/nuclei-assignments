import 'dart:io';
import 'user.dart';
import 'util.dart';

void addUser() {
  // Input user's Full Name
  do {
    stdout.write("Enter the full name:   ");
  } while (false);

  // Input user's Age
  do {
    stdout.write("Enter the age:   ");
  } while (false);

  // Input user's Address
  do {
    stdout.write("Enter the address:   ");
  } while (false);

  // Input user's Roll Number
  do {
    stdout.write("Enter the roll number:   ");
  } while (false);
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

  var test = User("Amit", 12, "Chennai", 17, ["A", "B", "E", "F"]);
  var test1 = User("Rahul", 26, "Mumbai", 19, ["B", "E", "F", "D", "C"]);
  var test2 = User("Max", 19, "Delhi", 12, ["E", "F", "A", "B"]);
  var test3 = User("Zyan", 19, "Delhi", 12, ["E", "F", "A", "B"]);
  var test4 = User("Aam", 19, "Delhi", 17, ["E", "F", "A", "B"]);
  var test5 = User("Aam", 19, "Delhi", 13, ["E", "F", "A", "B"]);

  try {
    Util.verifyCourses(test.courses);
    test.showUserDetails();
  } catch (error) {
    print(error);
  }

  // print(User.users);
  // print(User.users[1].name);
  test.showAllUsersInAscending();
  print("_____________________");
  test.showAllUsersInDescending();
}
