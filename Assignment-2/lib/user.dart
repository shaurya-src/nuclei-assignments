import 'dart:collection';
import 'view_user.dart';

class User {
  // define attributes of the User class
  final String name;
  final int age;
  final String address;
  final int rollNumber;
  final List<String> courses;

  // Data structure to store students
  static HashSet registeredRollNumbers = new HashSet<int>();
  static List<User> registeredUsers = [];

  // Constant constructur to initialize a User object
  // All the arguments are mandatory
  User(this.name, this.age, this.address, this.rollNumber, this.courses) {
    registeredUsers.add(this);
    ViewUser.sortUsers();
  }

  // From JSON to User object
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        address = json['address'],
        rollNumber = json['rollNumber'],
        // By default: dynamic list. Using cast to get List<String>
        courses = json['courses'].cast<String>();

  // From User object to JSON
  Map<String, dynamic> toJson() => {'name': name, 'age': age, 'address': address, 'rollNumber': rollNumber, 'courses': courses};
}
