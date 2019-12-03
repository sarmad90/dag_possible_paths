require "../common_graph/base"
require 'set'

class Graph < CommonGraph::Base
  def paths_between(source_node:, destination_node:)
    @destination_node = destination_node
    @source_node = source_node
   	find_paths(current_node: source_node)
   	valid_paths
  end

  private

  def find_paths(current_node:, current_path: [])
  	current_path.push(current_node)
  	if current_node == destination_node
  		valid_paths.push(current_path.dup)
  	else
  		adjacency_list[current_node].each do |child|
  			find_paths(current_node: child, current_path: current_path)
  		end
  	end
  	current_path.pop
  end

  def create_adjacency_list
    adjacency_list = {}
    edge_pairs.each do |edge_pair|
    	adjacency_list[edge_pair.first] = Set.new if adjacency_list[edge_pair.first].nil?
    	adjacency_list[edge_pair.last] = Set.new if adjacency_list[edge_pair.last].nil?
    	adjacency_list[edge_pair.first].add edge_pair.last
    end
    adjacency_list
  end

  def valid_paths
    @valid_paths ||= []
  end
end
