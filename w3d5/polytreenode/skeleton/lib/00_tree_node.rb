require "byebug"

class PolyTreeNode
    
    attr_reader :value, :parent, :children
    def inspect
        @value.inspect
    end

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parentnode)
        old_parent = @parent
        @parent = parentnode
        if @parent != nil && !@parent.children.include?(self) 
            @parent.children << self
            old_parent.children.delete(self) if old_parent
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "node is not a child" if child.parent == nil 
        child.parent = nil 
    end

    def dfs(target_value)
        return self if self.value == target_value
        
        if !@children.empty? 
            @children.each do |child| 
                a = child.dfs(target_value)
                return a if a != nil 
            end
        end

        nil
    end


    def bfs(target_value)
        return self if self.value == target_value
        arr = []
        arr.concat(@children)

        until arr.empty?
            child = arr.shift
            return child if child.value == target_value
            arr.concat(child.children)
        end
        nil
    end
end