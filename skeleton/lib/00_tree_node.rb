require "byebug"

class PolyTreeNode


    attr_reader :value, :parent, :children

    def initialize(val)
        @value = val
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        previous_parent = @parent 
        @parent = node
        previous_parent.remove_child(self) unless previous_parent.nil?

        unless node.nil?
            node.add_child(self) if !node.children.include?(self)
        end
    end

    def add_child(node)
       node.parent = self if node.parent != self
       @children << node if !@children.include?(node)


    end

    def remove_child(node)
        node.parent = nil unless node.parent != self
        if @children.include?(node)
            @children = @children.reject {|child| child == node}
        else
            raise "ChildNotFound"
        end
    end


end