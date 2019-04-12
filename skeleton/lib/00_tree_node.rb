class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
        @value = val
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        @parent = node
        # self.add_child(node) if !@children.include?(node)
        node.add_child(self) if !node.children.include?(self)

    end

    def add_child(node)
       node.parent = self if node.parent != self
       @children << node if !@children.include?(node)


    end


end