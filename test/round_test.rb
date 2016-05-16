require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry' # should this be removed before submission

class RoundTest < Minitest::Test

  def test_it_has_a_deck_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_guesses_is_an_empty_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_records_and_counts_one_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("6", card_2)
    round.record_guess(guess)
    assert_equal guess, round.guesses.first
    assert_equal 1, round.guesses.count
  end

  def test_it_gets_the_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("6", card_2)
    round.record_guess(guess)
    assert_equal "Incorrect.", round.guesses.first.feedback
  end

  def test_it_records_the_number_of_correct_responses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    round.record_guess(guess_1)
    assert_equal 1, round.number_correct
  end

  def test_it_counts_additional_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("93,000", card_2)
    round.record_guess(guess_1)
    round.record_guess(guess_2)
    # assert_equal card_2, round.current_card
    assert_equal 1, round.number_correct
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_the_perecentage_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess_1 = Guess.new("Juneau", card_1)
    guess_2 = Guess.new("93,000", card_2)
    round.record_guess(guess_1)
    round.record_guess(guess_2)
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

end
