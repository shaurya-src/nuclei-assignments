import 'dart:collection';

class User {
  // define attributes of the User class
  final String name;
  final int age;
  final String address;
  final int rollNumber;
  final List<String> courses;

  // Data structure to store students
  static SplayTreeMap users = SplayTreeMap();

  // Constant constructur to initialize a User object
  // All the arguments are mandatory
  User(this.name, this.age, this.address, this.rollNumber, this.courses) {
    users[rollNumber] = [name, age, address, courses];
  }

  void showUserDetails() {
    print("__________________________________________________________");
    print("Name \t Roll Number \t Age \t Address \t Courses");
    print("__________________________________________________________");
    print("$name \t $rollNumber \t\t $age \t $address \t ${courses.join(',')}");
  }

  void showAllUsersInAscending() {}

  void showAllUsersInDescending() {}
}
