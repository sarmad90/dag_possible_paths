module CommonGraph
  module Spec
    class Base < Test::Unit::TestCase
      private

      def simple_graph_and_expected_paths
        graph_edge_pairs = [[1,2], [1,3], [2,4], [3, 4]]
        expected_paths = [[1, 2, 4], [1, 3, 4]]
        graph = Graph.new(graph_edge_pairs)
        return graph, expected_paths
      end

      def long_graph_and_expected_paths
        graph_edge_pairs = [[1,2], [1,4], [1,3], [1,6], [2,3], [2,4], [2,6], [3,4], [3,5], [4,5], [5,6], [6, 7], [7,8]]
        expected_paths = [[1, 2, 3, 4, 5, 6], [1, 2, 3, 5, 6], [1, 2, 4, 5, 6], [1, 2, 6], [1, 4, 5, 6], [1, 3, 4, 5, 6], [1, 3, 5, 6], [1, 6]]
        graph = Graph.new(graph_edge_pairs)
        return graph, expected_paths
      end

      def very_long_graph_and_expected_paths
        graph_edge_pairs = [[1,2], [2,3], [2,4], [3,9], [4,5], [4,10], [5,6], [6,7], [6,10], [6,12], [7,8], [7,11], [8,9], [9,10], [10,11], [11,12], [12, 13], [13, 14], [14, 15], [15, 16]]
        expected_paths = [[5, 6, 7, 8, 9, 10], [5, 6, 10]]
        graph = Graph.new(graph_edge_pairs)
        return graph, expected_paths
      end
    end
  end
end