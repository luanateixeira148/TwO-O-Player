class Question

  attr_accessor :answer

  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @answer = @num1 + @num2
  end

  def question
    puts "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer player_answer, current_player
    if player_answer == @answer
      puts "YES! You are correct."
    else 
      puts "Seriously? No!"
      current_player.die
    end
  end

end