module CommonGraph
  class Base
    attr_reader :source_node, :destination_node, :edge_pairs

    def initialize(edge_pairs)
      @edge_pairs = edge_pairs
    end

    private

    def graph
      @graph ||= create_graph
    end

    def adjacency_list
      @adjacency_list ||= create_adjacency_list
    end
  end
end
