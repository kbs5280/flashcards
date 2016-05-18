require './test/test_helper.rb'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'

class RoundTest < Minitest::Test
  attr_reader :card_1, :card_2, :deck, :round, :g1_incorrect, :g1_correct

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
    @g1_correct = ("Juneau")
    @g1_incorrect = ("6")
  end

  def test_it_has_a_deck_of_cards
    assert_equal deck, round.deck
  end

  def test_guesses_is_an_empty_array
    assert_equal [], round.guesses
  end

  def test_current_card
    assert_equal card_1, round.current_card
  end

  def test_records_and_counts_one_guess
    round.record_guess(g1_correct)

    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal 1, round.guesses.count
  end

  def test_it_gets_feedback
    round.record_guess(g1_incorrect)

    assert_equal "Incorrect.", round.guesses.first.feedback
  end

  def test_it_records_the_number_of_correct_responses
    round.record_guess(g1_correct)

    assert_equal 1, round.number_correct
  end

  def test_current_card_advances_with_correct_guess
    round.record_guess(g1_correct)

    assert_equal card_2, round.current_card
  end

  def test_the_perecentage_of_correct_guesses
    round.record_guess(g1_correct)
    round.record_guess(g1_incorrect)
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end
end
