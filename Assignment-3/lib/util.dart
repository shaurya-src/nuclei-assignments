import 'graph.dart';

class Util {
  // Function to check if node ID is already present
  static bool idAlreadyPresent(Graph graph, int nodeId) {
    return graph.nodes.containsKey(nodeId);
  }

  // Function to check if given string is numeric
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
