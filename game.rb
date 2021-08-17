class Game

  def initialize
    @player1 = Player.new('P1')
    @player2 = Player.new('P2')
    @current_player = @player1
  end

  def switch_player current_player
    if current_player === @player2
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  def play
    question = Question.new
    question.question

    player_answer = gets.chomp.to_i
    question.check_answer player_answer, @current_player
    
    if @current_player.life === 0
      define_winner
    else 
      start_new_round
    end

  end

  def start_new_round
    puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
    puts "----- NEW TURN -----"
    switch_player @current_player
    puts "Current player: #{@current_player.name}, lifes: #{@current_player.life}"
    play
  end

  def define_winner
    if @current_player == @player1
      @winner = @player2
    else
      @winner = @player1
    end
    show_end_result
  end 

  def show_end_result
    puts "The winner is #{@winner}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end