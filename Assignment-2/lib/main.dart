import 'dart:io';
import 'user_details.dart';

void main() async {
  bool noExit = true;

  // Load users from memory
  await UserDetails.loadUsers();

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
          UserDetails.addUser();
          break;
        case 2:
          UserDetails.displayUser();
          break;
        case 3:
          UserDetails.deleteUser();
          break;
        case 4:
          UserDetails.saveUsers();
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
