import 'dart:io';
import 'user.dart';
import 'util.dart';
import 'dart:convert';

class ViewUser {
  static const String _fields = "Name \t Roll Number \t Age \t Address \t Courses";
  static const String _seperator = "__________________________________________________________";

  // Function to sort users
  static void sortUsers() {
    User.registeredUsers.sort((a, b) => a.rollNumber.compareTo(b.rollNumber));
    User.registeredUsers.sort((a, b) => a.name.compareTo(b.name));
  }

  // Method to show users in ascending order
  static void showAllUsersInAscending() {
    print("$_seperator \n $_fields \n $_seperator");
    for (User user in User.registeredUsers) {
      print("${user.name} \t ${user.rollNumber} \t\t ${user.age} \t ${user.address} \t ${user.courses.join(',')}");
    }
  }

  // Metehod to show users in descending order
  static void showAllUsersInDescending() {
    print("$_seperator \n $_fields \n $_seperator");
    for (int index = User.registeredUsers.length - 1; index >= 0; index--) {
      User user = User.registeredUsers[index];
      print("${user.name} \t ${user.rollNumber} \t\t ${user.age} \t ${user.address} \t ${user.courses.join(',')}");
    }
  }

  // Function to delete user
  static bool deleteUser(int rollNumber) {
    if (Util.isRollNumberAlreadyPresent(rollNumber)) {
      for (User user in User.registeredUsers) {
        if (user.rollNumber == rollNumber) {
          User.registeredUsers.remove(user);
        }
      }
    } else {
      return false;
    }

    return true;
  }

  // Function to save Users to memory
  static void saveUsers() {
    File outputFile = File('assets/user_data.txt');
    try {
      outputFile.createSync();
      for (User user in User.registeredUsers) {
        String json = jsonEncode(user);
        outputFile.writeAsStringSync(json, mode: FileMode.writeOnly);
        outputFile.writeAsStringSync("\n", mode: FileMode.writeOnly);
      }
      print("Saved all users successfully!");
    } catch (exception) {
      print(exception);
    }
  }
}
