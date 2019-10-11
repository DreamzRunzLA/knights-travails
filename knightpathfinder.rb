require_relative 'polytreenode.rb'

class KnightPathFinder
    def initialize(starting_position)
        @starting_position = starting_position
        @size = 8
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
end
