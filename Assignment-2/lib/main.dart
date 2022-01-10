import 'dart:io';
import 'user.dart';
import 'util.dart';

void addUser() {
  print("yo");
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
  try {
    Util.verifyCourses(test.courses);
    test.showUserDetails();
  } catch (error) {
    print(error);
  }

  print(User.users);
}
