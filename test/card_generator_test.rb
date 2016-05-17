require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'
require 'pry'

class CardGeneratorTest < Minitest::Test

  def test_it_returns_an_array
    filename = "cards.txt"
    gen = CardGenerator.new(filename)
    assert_equal Array, gen.cards.class
  end

  def test_it_creates_new_cards
    filename = "cards.txt"
    gen = CardGenerator.new(filename)
    #need a test here
  end

end
