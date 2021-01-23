class Game 
  attr_accessor :board, :player_1, :player_2, :ween
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8], 
      [0,3,6], 
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player 
    if board.turn.even?
      return @player_1
    else
      return @player_2
    end
  end 
   
  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @board.cells[combination[1]] &&
         @board.cells[combination[1]] == @board.cells[combination[2]] 
          return combination
      end
    end
    return false
  end

  def draw?
    if self.won? == false &&  @board.full? == true 
      return true
    else 
      return false
    end
  end 
  
  def over? 
    if self.draw? == true || self.won? != false 
      return true 
    else 
      return false 
    end 
  end 
  
 def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    else 
      return nil 
    end
  end
  
  def turn
    input = current_player.move(board).to_i
    if board.valid_move?(input)
      board.update(input, current_player)
    elsif input.between?(1, 9) == false
      puts "That is an invalid move"
  end
  
end 