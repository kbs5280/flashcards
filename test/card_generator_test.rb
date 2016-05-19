require './test/test_helper.rb'
require './lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test

  def test_it_returns_an_array
    filename = "default.txt"
    gen = CardGenerator.new(filename)
    assert_instance_of Array, gen.cards
  end

  def test_it_creates_new_cards
    filename = "default.txt"
    gen = CardGenerator.new(filename)
    assert_equal "10", gen.cards.first.answer
    assert_equal "red panda", gen.cards[1].answer
  end

end
