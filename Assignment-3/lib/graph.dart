class Node {
  final String id;
  final String label;
  final Map<String, dynamic>? additionalInfo;

  Node(this.id, this.label, [this.additionalInfo]);
}

class Graph {
  final Node root = Node('0', 'root');
  Map<String, Node> nodes = {};
  Map<String, List<String>> graph = {};

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
  String getDecendents(String nodeId) {
    return '';
  }

  // Method to delete a dependency
  void deleteDependency(String parentId, String childId) {
    ;
  }

  // Method to remove a node
  void deleteNode(String nodeId) {
    ;
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
