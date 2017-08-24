class Player
  attr_reader :name, :type

  def inititalize(name, type)
      @name = name
      @type = type
  end
    
end

class Board
  attr_reader :size
  
  def inititalize(size = 3)
    @size = size
    @board = Array.new(size) { Aray.new(size) }
  end


    
end 

class GameManager
  
  def start_game
    init_players
    init_board
    
    puts "OK! #{@player1.name} will go first with #{@player1.type} type"
    puts "And #{@player2.name} will play with #{@player2.type} type"
     
  end


  def end_game 
    
  end

  private 
  def init_players
    puts "Welcome to tic tac toe!"
    print "Please enter player 1 name: "
    player1_name = gets.chop
    print "please enter player 1 type (x or o): "
    player1_type = gets.chop
    
    print "Please enter player 2 name: "
    player2_name = gets.chop
    player2_type = player1_type == "x" ? "o" : "x"
    
    @player1 = Player.new(name: player1_name, type: player1_type)
    @player2 = Player.new(name: player2_name, type: player2_type)
  end
    
  def init_board(size)
    # print "Please enter board size: "
    # board_size = gets.chop.to_i

    @board = Board.new(size: 3)
    
  end


  def foo
  end
  
end

gm = GameManager.new

gm.start_game
