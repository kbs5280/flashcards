require_relative 'card'
require 'pry'

class CardGenerator

  def initialize(filename)
    @cards = File.read(filename)
  end

  def cards
    @split = @cards.split("\n").map do |card|
      card.split(",")
    end
    @result = @split.map do |card|
      Card.new(card[0], card[1])
    end
  end

end
