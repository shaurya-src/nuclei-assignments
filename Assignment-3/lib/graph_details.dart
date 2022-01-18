import 'dart:io';
import 'graph.dart';
import 'util.dart';
import 'node_traversal.dart';

class GraphDetails {
  static void addNode(Graph graph) {
    bool error = false;
    do {
      try {
        error = false;
        stdout.write("\nEnter Node ID:  ");
        int nodeId = int.parse(stdin.readLineSync().toString());
        stdout.write("\nEnter Node Label:  ");
        String nodeLabel = stdin.readLineSync().toString();
        stdout.write("\nEnter Additional Info (key:value):  ");
        List<String> infoList = stdin.readLineSync().toString().split(':');
        Map<String, String> additional = {infoList[0].trim(): infoList[1].trim()};

        // Validate
        if (Util.idAlreadyPresent(graph, nodeId) || Util.isNumeric(nodeLabel) || nodeLabel.isEmpty) {
          throw Exception("Invalid input");
        }

        Node node = Node(nodeId, nodeLabel, additional);
        graph.addNode(node);
        print("Node added successfully!");
      } catch (exception) {
        error = true;
        print("Invalid Details. Try Again!");
      }
    } while (error);
  }

  static void addDependency(Graph graph) {
    bool error = false;
    do {
      try {
        error = false;
        stdout.write("\nEnter Source Node ID:  ");
        int srcId = int.parse(stdin.readLineSync().toString());
        stdout.write("\nEnter Destination Node ID:  ");
        int destId = int.parse(stdin.readLineSync().toString());

        if (!(Util.idAlreadyPresent(graph, srcId) && Util.idAlreadyPresent(graph, destId))) {
          throw Exception("Node not present!");
        }

        graph.addDependency(srcId, destId);
        print("Dependency added successfully!");
      } catch (exception) {
        error = true;
        print("Invalid input! Try Again.");
      }
    } while (error);
  }

  static void removeNode(Graph graph) {
    bool error = false;
    do {
      try {
        error = false;
        stdout.write("\nEnter Node ID to remove:  ");
        int removeId = int.parse(stdin.readLineSync().toString());

        if (!Util.idAlreadyPresent(graph, removeId)) {
          throw Exception("Node not found!");
        }

        graph.deleteNode(removeId);
        print("Node Deleted successfully");
      } catch (exception) {
        error = true;
        print("Invalid input! Try Again.");
      }
    } while (error);
  }

  static void removeDependency(Graph graph) {
    bool error = false;
    do {
      try {
        error = false;
        stdout.write("\nEnter Source Node ID:  ");
        int srcId = int.parse(stdin.readLineSync().toString());
        stdout.write("\nEnter Destination Node ID:  ");
        int destId = int.parse(stdin.readLineSync().toString());

        if (!(Util.idAlreadyPresent(graph, srcId) && Util.idAlreadyPresent(graph, destId))) {
          throw Exception("Node not present!");
        }

        graph.deleteDependency(srcId, destId);
        print("Dependency Deleted Successfully");
      } catch (exception) {
        error = true;
        print("Invalid input! Try Again.");
      }
    } while (error);
  }

  static void showChildrens(Graph graph) {}
  static void showParents(Graph graph) {}
  static void showDescendants(Graph graph) {}
  static void showAncestors(Graph graph) {}
}
