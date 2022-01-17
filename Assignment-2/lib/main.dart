import 'dart:io';
import 'util.dart';

void main() async {
  bool noExit = true;

  // Load users from memory
  await Util.loadUsers();

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
          Util.addUser();
          break;
        case 2:
          Util.displayUser();
          break;
        case 3:
          Util.deleteUser();
          break;
        case 4:
          Util.saveUsers();
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
