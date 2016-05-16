require 'pry'

class Guess
  attr_accessor :response,
                :card

  def initialize(response, card)
    @response = response
    @card = card
    @feedback = feedback
  end

  def correct?
    @response == card.answer
  end

  def feedback
    case
    when correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
