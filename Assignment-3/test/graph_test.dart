import 'package:test/test.dart';
import '../lib/graph.dart';
import '../lib/node_traversal.dart';

main() {
  Graph testGraph = Graph();

  Node one = Node(1, "one");
  Node two = Node(2, "two");
  Node three = Node(3, "three");
  Node four = Node(4, "four");
  Node five = Node(5, "five", {"Some": "Info"});
  Node six = Node(6, "six");
  Node seven = Node(7, "seven");
  Node eight = Node(8, "eight");

  test('Check node id', () {
    expect(one.id, 1);
  });

  test('Check node label', () {
    expect(three.id, 3);
  });

  test("Check additional info", () {
    expect(five.additionalInfo!["Some"], "Info");
  });

  test('Check immediate childs', () {
    testGraph.addNode(one);
    testGraph.addNode(three);
    testGraph.addNode(four);
    testGraph.addDependency(1, 3);
    testGraph.addDependency(1, 4);
    var _childs = testGraph.getImmediateChild(1);
    expect(_childs, [three, four]);
  });

  test('Check immediate parents', () {
    testGraph.addNode(two);
    testGraph.addNode(six);
    testGraph.addNode(seven);
    testGraph.addDependency(2, 7);
    testGraph.addDependency(6, 7);
    var _parents = testGraph.getImmediateParent(7);
    expect(_parents, [two, six]);
  });

  test('Check if node is removed', () {
    testGraph.addNode(one);
    testGraph.addNode(three);
    testGraph.addNode(eight);
    testGraph.deleteNode(8);
    expect(testGraph.nodes.values.contains(eight), false);
  });

  test('Check descendants', () {
    testGraph.addNode(one);
    testGraph.addNode(three);
    testGraph.addNode(four);
    testGraph.addDependency(1, 3);
    testGraph.addDependency(3, 4);
    var _descendants = testGraph.getDescendants(1);
    expect(_descendants, [three, four]);
  });

  test('Check ancestors', () {
    testGraph.addNode(one);
    testGraph.addNode(three);
    testGraph.addNode(four);
    testGraph.addDependency(1, 3);
    testGraph.addDependency(3, 4);
    var _ancestors = testGraph.getAncestors(4);
    expect(_ancestors, [three, one]);
  });
}
