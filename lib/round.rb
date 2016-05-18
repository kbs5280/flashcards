require_relative 'guess'

class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck           = deck
    @guesses        = []
    @number_correct = 0
  end

  #GAME PLAY

  def start
    welcome_message
    while current_card != nil
      game_play
    end
    closing_message
    # write
  end

  #EVALUATIONS

  def record_guess(response)
    guess = Guess.new(response, current_card)
    @guesses << guess
    case
    when guess.correct?
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

  #RESULTS

  # def write
  #   File.open("results-#{Time.now.strftime("%Y-%m-%e-%I:%M%p")}.txt", 'w') { |file| file.write(results) }
  # end

  def results
    results = []
    @guesses.each do |guess|
      results << guess.card.question
      results << guess.card.answer
      results << guess.response
      results << guess.feedback
    end
    results.each_slice(4).to_a.join("\n")
  end

  #MESSSAGES

  def welcome_message
    puts "Welcome! You're playing with #{@deck.count} cards.\n__________________________________________________"
  end

  def game_play
    puts "This is card #{guesses.count + 1} out of #{@deck.count}"
    puts "Question: #{deck.cards[guess_count].question}"
    guess = gets.chomp
    record_guess(guess)
  end

  def closing_message
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{guess_count} for a score of #{percent_correct}%."
  end

end
