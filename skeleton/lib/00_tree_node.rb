require "byebug"

class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
        @value = val
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        return nil if @parent == node

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

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        arr = [self]
        until arr.empty?
            temp = arr.shift
            return temp if temp.value == target
            arr += temp.children
        end
        nil
    end
end