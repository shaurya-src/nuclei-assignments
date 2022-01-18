import 'traversal.dart';
import 'graph.dart';

void main() {
  Graph dag = Graph();

  // Define nodes
  Node one = Node(1, 'First Node');
  Node two = Node(2, 'Second Node');
  Node three = Node(3, 'Third Node');
  Node four = Node(4, 'Fourth Node');
  Node five = Node(5, 'Fifth Node');
  Node six = Node(6, 'Sixth Node');
  Node seven = Node(7, 'Seventh Node');
  Node eight = Node(8, 'Eighth Node');

  // Add nodes
  dag.addNode(one);
  dag.addNode(two);
  dag.addNode(three);
  dag.addNode(four);
  dag.addNode(five);
  dag.addNode(six);
  dag.addNode(seven);
  dag.addNode(eight);
  // dag.showNodes();

  // Add dependency
  dag.addDependency(one.id, three.id);
  dag.addDependency(one.id, four.id);
  dag.addDependency(two.id, three.id);
  dag.addDependency(two.id, five.id);
  dag.addDependency(two.id, eight.id);
  dag.addDependency(three.id, eight.id);
  dag.addDependency(four.id, six.id);
  dag.addDependency(four.id, seven.id);
  // dag.showGraph();

  // Traversal for descendants
  // Traversal traversal = Traversal();
  // Util.dfs(dag.graph, five, traversal);
  // print(traversal);
  print(dag.getDescendants(1));
  print(dag.getAncestors(8));
}
