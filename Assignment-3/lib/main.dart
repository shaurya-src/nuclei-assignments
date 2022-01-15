import 'graph.dart';

void main() {
  Graph dag = Graph();
  Node root = Node('a', 'First Node');
  Node child = Node('b', 'Child Node');
  dag.addNode(root);
  dag.addNode(child);
  dag.showNodes();

  dag.addDependency(root.id, child.id);
  dag.showGraph();
}
