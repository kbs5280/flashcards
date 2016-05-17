class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "__________________________________________________\n"
    while current_card != nil
      puts "This is card #{guesses.count + 1} out of #{@deck.count}"
      puts "Question: #{deck.cards[guess_count].question}"
      guess = gets.chomp
      record_guess(guess)
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{guess_count} for a score of #{percent_correct}%."
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    @guesses << guess
    if guess.correct?
      @number_correct += 1
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

  def current_card
    deck.cards[@guesses.count]
  end

  def percent_correct
    ((@number_correct / @guesses.count.to_f) * 100).to_i
  end

  def guess_count
    @guesses.count
  end

end
