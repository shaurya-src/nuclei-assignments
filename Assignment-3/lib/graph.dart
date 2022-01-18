class Node {
  final int id;
  final String label;
  final Map<String, dynamic>? additionalInfo;

  Node(this.id, this.label, [this.additionalInfo]);
}

class Graph {
  final Node root = Node(0, 'root');
  Map<int, Node> nodes = {};
  Map<Node, List<Node>> graph = {};

  // Method to get immediate parent of a node
  String getImmediateParent(String nodeId) {
    List<String> _parents = [];
    this.graph.forEach((key, value) => {
          if (value.contains(nodeId)) {_parents.add(key)}
        });
    return "$_parents";
  }

  // Method to get immediate child of a node
  String getImmediateChild(String nodeId) {
    return "${this.graph[nodeId]}";
  }

  //Method to get ancestors of a node
  String getAncestors(String nodeId) {
    return '';
  }

  //Method to get decendents of a node
  List<String> getDecendents(String nodeId) {
    List<String> decendents = [];
    List<String>? immediateChild = this.graph[nodeId];

    if (immediateChild == null || immediateChild.isEmpty) {
      return [];
    }

    for (String childId in immediateChild) {
      decendents.add(childId);
    }
    return decendents;
  }

  // Method to delete a dependency
  void deleteDependency(String parentId, String childId) {
    this.graph[parentId]!.remove(childId);
    if (this.graph[parentId]!.isEmpty) {
      this.graph.remove(parentId);
    }
  }

  // Method to remove a node
  void deleteNode(String nodeId) {
    this.nodes.remove(nodeId);
    this.graph.remove(nodeId);
    this.graph.forEach((key, value) => {
          if (value.contains(nodeId)) {value.remove(nodeId)}
        });
  }

  // Method to add a dependency
  // Keep check for cyclic dependency
  void addDependency(String parentId, String childId) {
    if (this.graph[parentId] != null) {
      this.graph[parentId]!.add(childId);
    } else {
      this.graph[parentId] = [childId];
    }
  }

  // Method to add a node to graph
  void addNode(Node node) {
    this.nodes[node.id] = node;
    this.graph[node] = [];
  }

  // Method to show the graph
  void showGraph() {
    print(this.graph);
  }

  // Method to show the nodes
  void showNodes() {
    this.nodes.forEach((key, value) => print("${value.id} : ${value.label}"));
  }
}
