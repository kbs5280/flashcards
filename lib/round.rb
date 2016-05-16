class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def record_guess(guess)
    @guesses << guess
    case
    when guess.feedback == "Correct!"
      @number_correct += 1
    else
    end
  end

  def number_correct
    @number_correct
  end

  def percent_correct
    percent = @number_correct / @guesses.count.to_f
    (percent * 100).to_i
  end

end
