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
      for (Node child in childs) {
        if (child == _deleteNode) {
          childs.remove(child);
        }
      }
    });
  }

  // Method to get immediate child of a node
  List<Node> getImmediateChild(int nodeId) {
    Node _node = this.nodes[nodeId]!;
    return this.graph[_node]!;
  }

  // Method to get immediate parent of a node
  String getImmediateParent(String nodeId) {
    List<String> _parents = [];
    this.graph.forEach((key, value) => {
          if (value.contains(nodeId)) {_parents.add(key)}
        });
    return "$_parents";
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

  // Method to show the graph
  void showGraph() {
    print(this.graph);
  }

  // Method to show the nodes
  void showNodes() {
    this.nodes.forEach((key, value) => print("${value.id} : ${value.label}"));
  }
}
