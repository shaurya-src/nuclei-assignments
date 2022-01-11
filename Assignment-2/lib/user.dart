import 'dart:collection';

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
    registeredRollNumbers.add(this.rollNumber);
    registeredUsers.add(this);
    registeredUsers.sort((a, b) => a.rollNumber.compareTo(b.rollNumber));
    registeredUsers.sort((a, b) => a.name.compareTo(b.name));
  }

  void showUserDetails() {
    print("__________________________________________________________");
    print("Name \t Roll Number \t Age \t Address \t Courses");
    print("__________________________________________________________");
    print("$name \t $rollNumber \t\t $age \t $address \t ${courses.join(',')}");
  }

  void showAllUsersInAscending() {
    for (User user in registeredUsers) {
      print("${user.name} ${user.rollNumber}");
    }
  }

  void showAllUsersInDescending() {
    for (int index = registeredUsers.length - 1; index >= 0; index--) {
      print("${registeredUsers[index].name} ${registeredUsers[index].rollNumber}");
    }
  }
}
