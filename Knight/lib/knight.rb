require_relative "00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
        new_pos = moves.map { |m| [pos.first + m.first, pos.last + m.last] }
        valid_ind = (0...8).to_a
        valid_new_pos = new_pos.select{ |coord| valid_ind.include?(coord.first) && valid_ind.include?(coord.last) }
    end

    def initialize(pos)
        @start_pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        #self.root_node.build_move_tree
    end

    def build_move_tree
        q = Array.new
        q << @root_node 

        until q.empty? 
            start_node_var = q.shift
            current_pos = start_node_var.value
            added_pos = new_move_positions(current_pos)
            added_node = added_pos.map { |val| PolyTreeNode.new(val)}
            added_node.each do |node|
                start_node_var.add_child(node)
                q << node
            end
        end

        return @root_node
    end

    def new_move_positions(pos)
        possible_new_moves = KnightPathFinder.valid_moves(pos)
        new_moves = possible_new_moves.reject { |m| @considered_positions.include?(m) }
        @considered_positions += new_moves
        new_moves
    end

    def print_tree
        q = Array.new
        q << @root_node 

        until q.empty? 
            node = q.shift
            id = node.value
            child_ids = node.children.map { |child| child.value }
            puts "#{id} :-> #{child_ids.inspect}"
            q += node.children
        end
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
    end

    def trace_path_back(pos_node)
        arr = []

        current_node = pos_node
        until current_node.nil?
            arr << current_node
            current_node = current_node.parent
        end

        arr
    end

end

def test_kpf
    kpf = KnightPathFinder.new([0, 0])
    target_pos = [7, 7]
    kpf.build_move_tree
    target_node = kpf.find_path(target_pos)
    result_arr = kpf.trace_path_back(target_node)
    kpf.print_tree
    p result_arr.map { |n| n.value }
    nil
end