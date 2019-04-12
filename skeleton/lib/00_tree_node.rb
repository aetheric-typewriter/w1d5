class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
        @value = val
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
            


        unless node.nil?
            @parent.remove_child(self) unless parent.nil?
            @parent = node
            node.add_child(self) if !node.children.include?(self)
        else
            
        end
    end

    def add_child(node)
       node.parent = self if node.parent != self
       @children << node if !@children.include?(node)


    end

    def remove_child(node)
        node.parent = nil unless node.parent == nil
        if @children.include?(node)
            @children = @children.reject {|child| child == node}
        else
            raise "ChildNotFound"
        end
    end


end