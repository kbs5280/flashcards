require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'pry'

  def filename
    puts "Enter a filename to choose a set of questions:\n 1. default.txt\n 2. muppets.txt "
    file = gets.chomp
    until File.exists?(file)
      puts "Choose a file of questions: "
      file = gets.chomp
    end
    file
  end

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start
