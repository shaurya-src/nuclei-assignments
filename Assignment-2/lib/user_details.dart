import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'view_user.dart';
import 'util.dart';
import 'user.dart';

class UserDetails {
  // Function to add users
  static void addUser() {
    String _name;
    int? _age;
    String _address;
    int? _rollNumber;
    List<String>? _courses;

    _name = Util.inputName();
    _age = Util.inputAge();
    _address = Util.inputAddress();
    _rollNumber = Util.inputRollNumber();
    _courses = Util.inputCourses();

    // Make user object from the input data
    User(_name, _age ?? 0, _address, _rollNumber ?? 0, _courses ?? []);
  }

  // Function to display users
  static void displayUser() {
    int _orderChoice;
    bool _error = false;

    // Take a valid input for choice
    do {
      _error = false;
      print("\nSelect the order: ");
      print("1. Ascending");
      print("2. Descending");
      stdout.write("Enter your choice:  ");
      try {
        _orderChoice = int.parse(stdin.readLineSync().toString());
        switch (_orderChoice) {
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
        _error = true;
        print("Invalid choice. Please try again.");
      }
    } while (_error);
  }

  // Function to delete user
  static void deleteUser() {
    int _rollNumberToDelete;
    stdout.write("\nEnter the Roll Number of user to delete:   ");
    try {
      _rollNumberToDelete = int.parse(stdin.readLineSync().toString());
      if (ViewUser.deleteUser(_rollNumberToDelete)) {
        print("User with Roll Number \"$_rollNumberToDelete\" deleted!");
      } else {
        throw Exception("Failed to delete user.");
      }
    } catch (exception) {
      print("Invalid Roll Number. Please try again!");
    }
  }

  // Function to load all the Users from memory
  static Future<void> loadUsers() async {
    final _file = File('assets/user_data.txt');
    Stream<String> _lines = _file.openRead().transform(utf8.decoder).transform(LineSplitter());
    try {
      await for (var line in _lines) {
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
