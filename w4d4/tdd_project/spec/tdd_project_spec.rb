require "tdd_project.rb"
require 'rspec'

describe "TDD project" do
    describe "#my_unique" do
        it "removes duplicates" do 
            expect(my_unique([1,2,3,3])).to eq([1,2,3])
        end
        it "returns new array" do
            expect(my_unique([1,2,3,3])).to_not be([1,2,3])
        end
    end
            

    describe "#two_sum" do
        it "finds all pairs and position where elements sum to 0, where smaller indices come first" do
            expect(two_sum([1,2,3,3,-1,-2])).to eq([[0,4],[1,5]]) 
        end
    end

     describe "#my_transpose" do
        it "transform rows into columns" do
            expect(my_transpose([[1,2],[3,4]])).to eq([[1,3],[2,4]])
        end
     end

     describe "stock_picker" do
        it "return most profitable dates to buy/sell" do 
            expect(stock_picker([280,340,315])).to eq ([0,1])
        end
        it "sell date should be after the buy date" do
            expect(stock_picker([500,280,340,315])).to eq([1,2])
        end
     end

     describe "towers_of_hanoi" do 
        subject(:game) {TowersOfHanoi.new([4],[3,2],[1])}
        describe "initialize" do 
            it "should create a towers instance variable" do 
                expect(game.towers).to eq([[4],[3,2],[1]])
            end
        end
        describe "move" do 
            context "when the piece is larger than the base piece" do
                it "should raise an error You must move onto a bigger piece" do
                    starting = 0
                    ending = 1
                    expect {game.move(starting,ending)}.to raise_error(MovementError)
                end
            end
            context "when the piece is smaller than the base piece" do
                starting = 2
                ending = 1
                before(:each) do 
                    game.move(starting,ending)
                end
                it "should move the piece onto the " do
                    expect(game.towers[ending]).to eq ([3,2,1])
                end
             end
        end
        describe "game_over?" do
            context "when game is not over" do
                it "should return false" do
                    expect(game.game_over?).to eq (false)
                end
            end
            context "game is over" do 
                let (:game2) {TowersOfHanoi.new([4,3,2,1],[],[])}
                it "should return true" do
                    expect(game2.game_over?).to eq (true)
                end
            end
        end
     end


end

