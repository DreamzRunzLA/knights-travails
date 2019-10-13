require_relative 'polytreenode.rb'

class KnightPathFinder
    attr_accessor :considered_positions, :root_node

    def initialize(starting_position, target_position)
        @starting_position = starting_position
        @target_position = target_position
        @size = 8
        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [@root_node]
        # build_move_tree(starting_position, target_position)
    end

    def self.valid_moves(pos)
        moves = []

        moves << PolyTreeNode.new([pos[0] - 1, pos[1] + 2])
        moves << PolyTreeNode.new([pos[0] - 1, pos[1] - 2])
        moves << PolyTreeNode.new([pos[0] - 2, pos[1] + 1])
        moves << PolyTreeNode.new([pos[0] - 2, pos[1] - 1])
        moves << PolyTreeNode.new([pos[0] + 1, pos[1] + 2])
        moves << PolyTreeNode.new([pos[0] + 1, pos[1] - 2])
        moves << PolyTreeNode.new([pos[0] + 2, pos[1] + 1])
        moves << PolyTreeNode.new([pos[0] + 2, pos[1] - 1])

        moves.select! do |move|
            move.value[0] < 8 && move.value[1] < 8 && move.value[0] > 0 && move.value[1] > 0
        end

        return moves
    end

    def find_path(start_pos, end_pos)

    end

    def valid_pos?(pos)
        pos.is_a?(Array) &&
          pos.length == 2 &&
          pos.all? { |x| x.between?(0, @size - 1) }
    end

    def parse_pos(string)
        string.split(",").map { |char| Integer(char) }
    end

    def new_move_positions(pos)
        new_nodes = self.class.valid_moves(pos)

        new_nodes.select! do |move|
            @considered_positions.include?(move.value) == false
        end

        new_nodes.each do |node|
            @considered_positions << node
        end

        return new_nodes
    end

    def build_move_tree(start=@root_node)
        new_move_positions(@starting_position).each do |node|
            start.children << node
        end

        return start
    end

end
