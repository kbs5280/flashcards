require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'pry'

  def filename
    puts "Choose a file of questions: "
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
