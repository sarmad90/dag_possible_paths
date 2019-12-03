require 'test/unit'
require_relative 'graph'
require '../common_graph/spec/base'

class GraphSpec < CommonGraph::Spec::Base
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
end