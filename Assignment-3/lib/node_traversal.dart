class Node {
  final int id;
  final String label;
  final Map<String, String>? additionalInfo;

  Node(this.id, this.label, [this.additionalInfo]);

  @override
  String toString() {
    return "ID: ${this.id}";
  }
}

class Traversal {
  final Set<Node> _visitedVertices;
  final List<Node> _visits;

  /// The visited vertices
  List<Node> get visits => _visits;

  /// Constructor
  Traversal()
      : _visitedVertices = <Node>{},
        _visits = <Node>[];

  /// check if node is visited already
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

  static void dfs(Map<Node, List<Node>> graph, Node node, Traversal traversal) {
    traversal.addVisited(node);
    traversal.addVisit(node);
    try {
      if (!graph[node]!.isEmpty) {
        for (Node childNode in graph[node]!) {
          if (!traversal.hasVisited(childNode)) {
            dfs(graph, childNode, traversal);
          }
        }
      }
    } catch (error) {}
  }

  static Map<Node, List<Node>> reverseGraph(Map graph) {
    Map<Node, List<Node>> reversedGraph = {};
    graph.forEach((parent, childs) {
      for (Node child in childs) {
        if (!reversedGraph.containsKey(child)) {
          reversedGraph[child] = [parent];
        } else {
          reversedGraph[child]!.add(parent);
        }
      }
    });
    return reversedGraph;
  }
}
