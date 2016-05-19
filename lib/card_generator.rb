require_relative 'card'

class CardGenerator

  def initialize(filename)
    @cards = File.read(filename)
  end

  def cards
    split = @cards.split("\n").map do |card|
      card.split(",")
    end
    split.map do |card|
      Card.new(card[0], card[1], card[2])
    end
  end

end
