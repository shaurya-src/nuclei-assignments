import 'package:graph/util.dart';

import 'graph.dart';

void main() {
  Graph dag = Graph();
  Node root = Node(1, 'First Node');
  Node child = Node(2, 'Second Node');
  Node child2 = Node(3, 'Third Node');
  dag.addNode(root);
  dag.addNode(child);
  dag.addNode(child2);
  dag.showNodes();

  dag.addDependency(root.id, child.id);
  dag.addDependency(child.id, child2.id);
  dag.addDependency(root.id, child2.id);
  dag.showGraph();

  // var x = dag.getImmediateChild(1);
  // print("Childs of 1: ");

  // var y = dag.getImmediateParent(2);
  // print("Parents of 3: ");

  dag.deleteDependency(root.id, child.id);
  dag.deleteNode(3);
  // dag.showGraph();

  // dag.deleteNode(child.id);
  // dag.showGraph();

  // Traversal traversal = Traversal();
  // Util.dfs(dag, "", traversal);
  // print(traversal);
  dag.showGraph();
}
