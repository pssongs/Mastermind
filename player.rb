class Player
  attr_accessor :previous_guesses , :current_guess
  def initialize()
    @previous_guesses = {}
    @current_guess = []
  end
end