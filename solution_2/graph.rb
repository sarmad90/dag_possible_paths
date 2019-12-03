require "../common_graph/base"

class Graph < CommonGraph::Base
  def paths_between(source_node:, destination_node:)
    return [] unless adjacency_list.key?(source_node)
    valid_paths = []

    adjacency_list[source_node].each do |next_node|
      if next_node == destination_node
        valid_paths << [source_node, destination_node]
      else
        paths_between(source_node: next_node, destination_node: destination_node).each do |path|
          valid_paths << [source_node, *path]
        end
      end
    end

    valid_paths
  end

  private

  def create_adjacency_list
    adjacency_list = {}

    edge_pairs.each do |edge_pair|
      adjacency_list[edge_pair[0]] = (adjacency_list[edge_pair[0]] || []) << edge_pair[1]
    end

    adjacency_list
  end
end