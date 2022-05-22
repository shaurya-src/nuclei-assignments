import 'package:graph/graph_details.dart';
import 'graph.dart';
import 'dart:io';

void main() {
  bool noExit = true;
  Graph dag = Graph();
  do {
    print('''

Please select an option:

1. Add a Node
2. Add dependency
3. Remove Node
4. Remove Dependency
5. View Immediate Child(s)
6. View Immediate Parent(s)
7. View Descendants
8. View Ancestors
9. Exit
''');

    stdout.write("Enter your choice: ");
    try {
      int choice = int.parse(stdin.readLineSync().toString());

      switch (choice) {
        case 1:
          GraphDetails.addNode(dag);
          break;
        case 2:
          GraphDetails.addDependency(dag);
          break;
        case 3:
          GraphDetails.removeNode(dag);
          break;
        case 4:
          GraphDetails.removeDependency(dag);
          break;
        case 5:
          GraphDetails.showChildrens(dag);
          break;
        case 6:
          GraphDetails.showParents(dag);
          break;
        case 7:
          GraphDetails.showDescendants(dag);
          break;
        case 8:
          GraphDetails.showAncestors(dag);
          break;
        case 9:
          noExit = false;
          break;
        default:
          throw Exception("Invalid choice");
      }
    } catch (error) {
      print("Please Enter a valid option!");
    }
  } while (noExit);
}
