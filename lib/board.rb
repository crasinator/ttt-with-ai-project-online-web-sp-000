class Board 
  
  def initialize
    @cells = Array.new(9, " ")
  end 
  
  def cells 
    @cells
  end 
  
  def cells=(cells)
    @cells = cells
  end
  
  def reset! 
    @cells.clear
    @cells = Array.new(9, " ")
  end 
  
  def display 
    var = @cells 
      puts " #{var[0]} | #{var[1]} | #{var[2]} "
      puts "-----------"
      puts " #{var[3]} | #{var[4]} | #{var[5]} "
      puts "-----------"
      puts " #{var[6]} | #{var[7]} | #{var[8]} "
  end
  
  def position(input)
    var = input.to_i - 1 
    return "#{cells[var]}"
  end 
  
  def full? 
    @cells.none? {|x| x == " "}
  end
  
  def turn_count 
    i = 0 
    @cells.each {|x| i += 1 if x == "X" || x == "O"}
    @turn = i 
  end 
  def turn 
    @turn.to_i
  end 
  
  def taken?(x)
    var = x.to_i - 1
    if @cells[var] == "X" || @cells[var] == "O"
      return true
    else 
      return false
    end  
  end 
  
  def valid_move?(x)
    var = x.to_i - 1
    if var.between?(0, 8) && taken?(x.to_i) == false
      return true 
    else
      return false
    end
  end
  
  def update(x, y)
    if valid_move?(x) 
      var = x.to_i - 1
      @cells[var] = y.token
    end
  end 
  
end 