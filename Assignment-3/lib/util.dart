import 'graph.dart';

class Traversal {
  final Set<Node> _visitedVertices;
  final List<Node> _visits;

  /// The visited vertices
  List<Node> get visits => _visits;

  /// Constructor
  Traversal()
      : _visitedVertices = <Node>{},
        _visits = <Node>[];

  /// Did this vertex visit already?
  bool hasVisited(Node node) {
    return _visitedVertices.contains(node);
  }

  /// Add this vertex to the visited set
  void addVisited(Node node) {
    _visitedVertices.add(node);
  }

  /// Add a new visit to the traversed list
  void addVisit(Node node) {
    _visits.add(node);
  }

  @override
  String toString() => _visitedVertices.toString();
}

class Util {
  static void dfs(Map<Node, List<Node>> graph, Node node, Traversal traversal) {
    traversal.addVisited(node);
    traversal.addVisit(node);
    if (!graph[node]!.isEmpty) {
      for (Node childNode in graph[node]!) {
        if (!traversal.hasVisited(childNode)) {
          dfs(graph, childNode, traversal);
        }
      }
    }
  }
}
