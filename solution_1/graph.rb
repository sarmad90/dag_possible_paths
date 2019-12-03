require "../common_graph/base"

class Graph < CommonGraph::Base
  attr_reader :connecting_pairs, :relevant_paths

  def initialize(edge_pairs)
    @edge_pairs = edge_pairs
    validate_edge_pairs!
  end

  def eliminate_irrelevant_edge_pairs
    edge_pairs.delete_if { |edge_pair| pair_out_of_scope?(edge_pair) }
  end

  def paths_between(source_node:, destination_node:)
    @source_node = source_node
    @destination_node = destination_node

    eliminate_irrelevant_edge_pairs

    @relevant_paths, @connecting_pairs = collect_relevant_paths_and_connecting_pairs

    valid_paths
  end

  private

  def valid_paths
    valid_paths = []

    relevant_paths.each do |relevant_pair|
      relevant_path_last_node = relevant_pair[-1]

      if relevant_path_last_node == destination_node
        valid_paths << relevant_pair
      else
        connecting_pairs.each do |connecting_pair|
          if connecting_pair[0] == relevant_path_last_node
            relevant_paths << (relevant_pair.dup << connecting_pair[-1])
          end
        end
      end
    end

    valid_paths
  end

  def validate_edge_pairs!
    # bang method because it will raise an error if validation fails
    raise ArgumentError.new("Invalid Graph") if !edge_pairs.is_a?(Array) && edge_pairs.empty?
  end

  def collect_relevant_paths_and_connecting_pairs
    relevant_paths = []
    connecting_pairs = []

    edge_pairs.each do |edge_pair|
      first_node_of_edge_pair = edge_pair[0] # readability

      if first_node_of_edge_pair == source_node # edge_pair is relevant within context of source and destination nodes
        relevant_paths << edge_pair
      else # edge_pair is connecting the source and destination nodes
        connecting_pairs << edge_pair
      end
    end

    return relevant_paths, connecting_pairs
  end

  def pair_out_of_scope?(pair)
    edge_start_node = pair[0]
    edge_end_node = pair[1]
    edge_start_node < source_node || edge_end_node > destination_node
  end
end
