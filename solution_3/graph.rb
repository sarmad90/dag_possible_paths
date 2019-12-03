require "../common_graph/base"

class Graph < CommonGraph::Base
  def paths_between(source_node:, destination_node:)
    @source_node = source_node
    @destination_node = destination_node

    valid_paths(starting_node: source_node)
  end

  private

  def valid_paths(starting_node:, path: [], visited: [], all_paths: [])
    visited[starting_node] = true
    path << starting_node

    if starting_node == destination_node
      all_paths << path.dup
    elsif graph[starting_node]
      graph[starting_node].each do |edge|
        valid_paths(starting_node: edge, path: path, visited: visited, all_paths: all_paths) unless visited[edge]
      end
    end

    path.pop
    visited[starting_node] = false

    all_paths
  end

  def create_graph
    graph = {}
    edge_pairs.each do |edge_pair|
      graph[edge_pair[0]] = [] unless graph[edge_pair[0]]
      graph[edge_pair[0]] << edge_pair[1]
    end
    graph
  end
end
