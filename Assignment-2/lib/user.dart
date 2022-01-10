class User {
  // define attributes of the User class
  final String name;
  final int age;
  final String address;
  final int rollNumber;
  final List<String> courses;

  // Constant constructur to initialize a User object
  // All the arguments are mandatory
  const User(this.name, this.age, this.address, this.rollNumber, this.courses);

  void showUserDetails() {
    print('''\n
>>>>>>>>>><<<<<<<<<<   
Name: $name
Age: $age
Address: $address
Roll Number: $rollNumber
Courses: $courses
>>>>>>>>>><<<<<<<<<<
    ''');
  }
}
