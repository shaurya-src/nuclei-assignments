import 'graph.dart';

void main() {
  Graph dag = Graph();
  Node root = Node('a', 'First Node');
  Node child = Node('b', 'Child Node');
  Node child2 = Node('c', 'Second Child');
  dag.addNode(root);
  dag.addNode(child);
  dag.addNode(child2);
  dag.showNodes();

  dag.addDependency(root.id, child.id);
  dag.addDependency(child.id, child2.id);
  dag.addDependency(root.id, child2.id);
  dag.showGraph();

  String x = dag.getImmediateChild('a');
  print("Childs: $x");

  String y = dag.getImmediateParent('c');
  print("Parents: $y");

  // dag.deleteDependency(root.id, child.id);
  // dag.showGraph();

  dag.deleteNode(child.id);
  dag.showGraph();
}
