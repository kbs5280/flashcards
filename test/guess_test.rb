require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require 'pry'

class GuessTest < Minitest::Test

  def test_it_gets_a_correct_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal card, guess.card
    assert_equal "Juneau", guess.response
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_it_gets_an_incorrect_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    
    assert_equal card, guess.card
    assert_equal "Saturn", guess.response
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

end
