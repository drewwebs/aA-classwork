require "byebug"
def my_unique(arr)
    result = []
    arr.each { |ele| result << ele if !result.include?(ele)}
    result
end

def two_sum(arr)
    result = []
    arr.each_with_index do |ele1,i|
        arr.each_with_index do |ele2,j|
            if ele1 + ele2 == 0 && i > j
                i > j ? result << [j,i] : result << [i,j]
            end
        end
    end
    result
end

def my_transpose(arr)
        arr.each_with_index do |row, i|
            arr.each_with_index do |ele, j|
                arr[i][j], arr[j][i]  = arr[j][i], arr[i][j] if i > j                
            end
        end
    arr
end

def stock_picker(arr)
    price_diff = 0
    dates = []
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j > i
                if (ele2 - ele1) > price_diff
                    dates = [i,j]
                    price_diff = (ele2 - ele1)
                end
            end
        end
    end
    dates
end

class MovementError < StandardError
    def initialize(msg="You must move onto a bigger piece")
        super(msg)
    end
end

class TowersOfHanoi

    attr_reader :towers

    def initialize(*towers)
        @towers = towers
    end
    


    def move(starting,ending)
        first = @towers[starting][-1]
        second = @towers[ending][-1]
        second = 100 if second.nil?
        raise MovementError if first > second 
        first = @towers[starting].pop
        @towers[ending].push(first)
    end

    def play
        render
        until game_over?
            get_move
            render
        end
    end
    
    def get_move
        begin
            puts "Enter a tower to take from"
            starting = gets.chomp.to_i
            puts "Enter a tower to move to"
            ending = gets.chomp.to_i
            move(starting,ending)
        rescue
            puts "You can't go there"
            retry
        end
    end

    def game_over?
        count = 0
        self.towers.each {|arr| count +=1 if arr.empty? }
        if count == 2
            return true
        else
            return false
        end
    end
                
    def render
        print self.towers
    end   
end

# game = TowerOfHanoi.new([4],[3,2],[1])

# game.play