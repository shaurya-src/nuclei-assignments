import 'dart:collection';

import 'graph.dart';

class Traversal {
  final Set<String> _visitedVertices;
  final List<String> _visits;

  /// The visited vertices
  List<String> get visits => _visits;

  /// Constructor
  Traversal()
      : _visitedVertices = <String>{},
        _visits = <String>[];

  /// Did this vertex visit already?
  bool hasVisited(String node) {
    return _visitedVertices.contains(node);
  }

  /// Add this vertex to the visited set
  void addVisited(String node) {
    _visitedVertices.add(node);
  }

  /// Add a new visit to the traversed list
  void addVisit(String node) {
    _visits.add(node);
  }

  @override
  String toString() => _visitedVertices.toString();
}

class Util {
  static void dfs(Graph dag, String node, Traversal traversal) {
    traversal.addVisited(node);
    traversal.addVisit(node);

    for (String childNode in dag.graph[node]!) {
      if (!traversal.hasVisited(childNode)) {
        dfs(dag, childNode, traversal);
      }
    }
  }
}
