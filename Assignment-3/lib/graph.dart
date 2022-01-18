import 'dart:io';
import 'package:graph/util.dart';

class Node {
  final int id;
  final String label;
  final Map<String, dynamic>? additionalInfo;

  Node(this.id, this.label, [this.additionalInfo]);

  @override
  String toString() {
    return "ID: ${this.id}, Label: ${this.label}";
  }
}

class Graph {
  Map<int, Node> nodes = {};
  Map<Node, List<Node>> graph = {};

  // Method to add a node to graph
  void addNode(Node node) {
    this.nodes[node.id] = node;
    this.graph[node] = [];
  }

  // Method to add a dependency
  // Keep check for cyclic dependency
  void addDependency(int parentId, int childId) {
    final Node _sourceNode = this.nodes[parentId]!;
    final Node _destinationNode = this.nodes[childId]!;
    this.graph[_sourceNode]!.add(_destinationNode);
  }

  // Method to remove a node
  void deleteNode(int nodeId) {
    Node? _deleteNode = this.nodes[nodeId];
    this.nodes.remove(nodeId);
    this.graph.remove(_deleteNode);

    this.graph.forEach((parent, childs) {
      childs.remove(_deleteNode);
    });
  }

  // Method to delete a dependency
  void deleteDependency(int parentId, int childId) {
    Node? _source = this.nodes[parentId];
    Node? _destination = this.nodes[childId];
    this.graph[_source]!.remove(_destination);
  }

  // Method to get immediate child of a node
  List<Node> getImmediateChild(int nodeId) {
    Node _node = this.nodes[nodeId]!;
    return this.graph[_node]!;
  }

  // Method to get immediate parent of a node
  List<Node> getImmediateParent(int nodeId) {
    List<Node> _parents = [];
    Node? _node = this.nodes[nodeId];
    this.graph.forEach((key, value) => {
          if (value.contains(_node)) {_parents.add(key)}
        });
    return _parents;
  }

  //Method to get ancestors of a node
  List<Node> getAncestors(int nodeId) {
    List<Node> _ancestors = [];
    return _ancestors;
  }

  // //Method to get decendents of a node
  // List<Node> getDescendants(int nodeId) {
  //   List<Node> _descendants = [];
  //   Traversal traversal = Traversal();
  //   Util.dfs(, child, traversal);
  //   var x = traversal.visits;
  //   print(x.runtimeType);
  //   return _descendants;
  // }

  // Method to show the graph
  void showGraph() {
    this.graph.forEach((key, value) {
      stdout.write("${key.id}: [ ");
      for (Node child in value) {
        stdout.write("${child.id} ");
      }
      stdout.write("] \n");
    });
  }

  // Method to show the nodes
  void showNodes() {
    this.nodes.forEach((key, value) {
      print(value.toString());
    });
  }
}
