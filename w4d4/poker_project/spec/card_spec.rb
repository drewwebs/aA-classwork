require "card"
require "rspec"

describe "card" do
    subject(:card) {Card.new("A","spades",14)}
    describe "#initialize" do
        it "creates instance variable :suit" do
            expect(card.suit).to eq("spades")
        end
        it "creates instance variable :val" do
            expect(card.value).to eq(14) 
        end
        it "creates instance variable :name" do
            expect(card.name).to eq("A") 
        end
    end
end