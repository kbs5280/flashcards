require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require 'pry' # should this be removed before submission

class CardTest < Minitest::Test

  def test_it_asks_and_answers_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

end
