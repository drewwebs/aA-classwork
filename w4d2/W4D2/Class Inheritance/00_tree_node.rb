require "byebug"
class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(parent_value)
        if @parent != nil
            @parent.children.delete(self)
        end
        
        @parent = parent_value

        if parent_value != nil
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise "error" if !self.children.include?(child_node)
    end

    def dfs(target_value)
        return self if target_value == self.value
        @children.each do |child|
            result = child.dfs(target_value)
            if result != nil
                return result
            end
        end
        return nil if self.children == []
    end

    def bfs(target_value)
        nodes = []
        nodes << self
        #debugger
        until nodes == []
            if target_value == nodes[0].value
                return nodes[0]
            else
                nodes[0].children.each do |child|
                    nodes << child
                end
                nodes.shift
            end
        end
        nil


        # return self if target_value == self.value
        # return nil if self.children == []

        # @children.each do |child|
        #     if child.value == target_value
        #         return child
        #     end
        # end

        # @children.each do |child|
        #     child.bfs(target_value)
        # end
    end

end