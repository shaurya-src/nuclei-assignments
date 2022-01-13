import 'dart:collection';

class Node {
  final String id;
  final String label;
  final Map<String, dynamic>? additionalInfo;

  Node(this.id, this.label, [this.additionalInfo]);
}

class Graph {
  final Node root = Node('0', 'root');
  Map<Node, List<Node>> graph = {};

  void addRoot(Node newNode) {
    if (graph.isEmpty) {
      this.graph[root] = [newNode];
    } else {
      this.graph[root]!.add(newNode);
    }
  }
}
