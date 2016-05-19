require './test/test_helper.rb'
require './lib/card.rb'

class CardTest < Minitest::Test

  def test_it_asks_and_answers_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau", "Starts with a 'J'")

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

end
