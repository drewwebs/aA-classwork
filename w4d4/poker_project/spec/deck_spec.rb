require "deck"
require "rspec"

describe "deck" do
    subject(:deck) {Deck.new}
    describe "#initialize" do
        it "creates instance variable deck with full deck of cards" do
            expect(deck.draw_pile.length).to eq(52)
        end
    end
end