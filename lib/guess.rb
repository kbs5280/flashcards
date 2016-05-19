class Guess
  attr_accessor :response,
                :card

  def initialize(response, card)
    @response = response
    @card     = card
    @feedback = feedback
  end

  def correct?
    response.downcase == card.answer.downcase
  end

  def feedback
    case
    when correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
