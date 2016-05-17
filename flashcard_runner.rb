require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'

card_1 = Card.new("Which ways is West?", "West")
card_2 = Card.new("Which ways is North?", "North")
card_3 = Card.new("Which ways is East?", "East")
card_4 = Card.new("Which ways is South?", "South")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

round.start
