require './generator.rb'

class Game
  include Generator

  def initialize(player)
    @player = player
    @turn = 0
    @finished = false
  end

  def play
    key = generate
    while !@finished
      puts @player.previous_guesses unless @turn == 0
      puts
      puts 'Available Colors: ["red","green","blue","yellow","black","orange","purple","pink"]' + "\n"
      puts
      puts "Input four colors one by one in order"
      puts


      first = gets.strip.downcase
      second = gets.strip.downcase
      third = gets.strip.downcase
      fourth = gets.strip.downcase

      @player.current_guess = [first,second,third,fourth]
      @turn += 1

      check_correct(key)

      @player.previous_guesses[@turn] = @player.current_guess

    end
  end

  def check_correct(key)
    color = 0
    both = 0
    in_both = []
    for i in 0..3 
      if key.include?(@player.current_guess[i])
        if @player.current_guess[i] == key[i]
          both += 1
          in_both.push(key[i])
        else
          color += 1 unless in_both.include?(@player.current_guess[i])
        end
      end
    end

    if both == 4
      puts "Congrats!"
      @finished = true
    elsif @turn == 12
      puts "You Lost! You Suck!"
      @finished = true
    else
      puts "Color & Placement Correct: #{both}, Only Color Correct: #{color}"
    end
  end

end
