import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'view_user.dart';
import 'util.dart';
import 'user.dart';

class UserDetails {
  // Function to add users
  static void addUser() {
    String name;
    int? age;
    String address;
    int? rollNumber;
    List<String>? courses;

    name = Util.inputName();
    age = Util.inputAge();
    address = Util.inputAddress();
    rollNumber = Util.inputRollNumber();
    courses = Util.inputCourses();

    // Make user object from the input data
    User(name, age ?? 0, address, rollNumber ?? 0, courses ?? []);
  }

  // Function to display users
  static void displayUser() {
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
            ViewUser.showAllUsersInAscending();
            break;
          case 2:
            ViewUser.showAllUsersInDescending();
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

  // Function to delete user
  static void deleteUser() {
    int rollNumberToDelete;
    stdout.write("\nEnter the Roll Number of user to delete:   ");
    try {
      rollNumberToDelete = int.parse(stdin.readLineSync().toString());
      if (ViewUser.deleteUser(rollNumberToDelete)) {
        print("User with Roll Number \"$rollNumberToDelete\" deleted!");
      } else {
        throw Exception("Failed to delete user.");
      }
    } catch (exception) {
      print("Invalid Roll Number. Please try again!");
    }
  }

  // Function to load all the Users from memory
  static Future<void> loadUsers() async {
    final file = File('assets/user_data.txt');
    Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
    try {
      await for (var line in lines) {
        if (!line.isEmpty) {
          var decoded = base64.decode(line);
          var decodedString = utf8.decode(decoded);
          final _json = jsonDecode(decodedString);
          User user = User.fromJson(_json);
          User.registeredUsers.add(user);
          User.registeredRollNumbers.add(user.rollNumber);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to save users to memory
  static saveUsers() {
    ViewUser.saveUsers();
  }
}
