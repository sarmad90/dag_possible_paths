require 'test/unit'
require_relative 'graph'

class GraphSpec < Test::Unit::TestCase
  def test_graph_with_many_paths
    graph, expected_paths = long_graph_and_expected_paths
    actual_paths = graph.paths_between(source_node: 1, destination_node: 6)
    assert_equal(expected_paths, actual_paths)
  end

  def test_simple_graph
    graph, expected_paths = simple_graph_and_expected_paths
    actual_paths = graph.paths_between(source_node: 1, destination_node: 4)
    assert_equal(expected_paths, actual_paths)
  end

  def test_path_from_the_middle
    graph, expected_paths = very_long_graph_and_expected_paths
    actual_paths = graph.paths_between(source_node: 5, destination_node: 10)
    assert_equal(expected_paths, actual_paths)
  end

  private

  def simple_graph_and_expected_paths
    graph_edge_pairs = [[1,2], [1,3], [2,4], [3, 4]]
    expected_paths = [[1,2,4], [1,3,4]]
    graph = Graph.new(graph_edge_pairs)
    return graph, expected_paths
  end

  def long_graph_and_expected_paths
    graph_edge_pairs = [[1,2], [1,4], [1,3], [1,6], [2,3], [2,4], [2,6], [3,4], [3,5], [4,5], [5,6], [6, 7], [7,8]]
    expected_paths = [[1, 6], [1, 2, 6], [1, 4, 5, 6], [1, 3, 5, 6], [1, 2, 3, 5, 6], [1, 2, 4, 5, 6], [1, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6]]
    graph = Graph.new(graph_edge_pairs)
    return graph, expected_paths
  end

  def very_long_graph_and_expected_paths
    graph_edge_pairs = [[1,2], [2,3], [2,4], [3,9], [4,5], [4,10], [5,6], [6,7], [6,10], [6,12], [7,8], [7,11], [8,9], [9,10], [10,11], [11,12], [12, 13], [13, 14], [14, 15], [15, 16]]
    expected_paths = [[5, 6, 10], [5, 6, 7, 8, 9, 10]]
    graph = Graph.new(graph_edge_pairs)
    return graph, expected_paths
  end
end