class Player
  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type 
  end

  def move
    puts "Where do you want to move (0..8)? #{@name}"
    location = gets.chop.to_i
    location 
  end
    
end

class Board
  def initialize
    @board = (0..8).to_a 
  end

  def getItem(index)
    @board[index]
  end
  def draw
    puts ""
    @board.each_index do |i|
      if (i + 1) % 3 == 0
        puts "#{@board[i]}"
        if i != @board.length - 1
          puts "--+---+--"
        end
      else
          print "#{@board[i]} | "
      end 
    end
  end

  def update(at, type)
    @board[at] = type 
  end 
    
end 

class GameManager
  
  def start_game
    init_players
    init_board
    
    puts "OK! #{@player1.name} will go first with #{@player1.type} type"
    puts "And #{@player2.name} will play with #{@player2.type} type"
    
    @board.draw
    turn = 0
    won = false
    player1_turn = true
    while(turn < 9)
        if player1_turn
            player1_turn = false
            location = @player1.move()
            @board.update(location, @player1.type)
            if win?
              won = true
              puts "#{@player1.name} won!"
            end  
        else
          player1_turn = true
          location = @player2.move()
          @board.update(location, @player2.type)
          if win?
            won = true 
            puts "#{@player2.name} won!"
          end
        end
       
        puts "Tie!" if turn == 8
        @board.draw
        
        break if won

        turn += 1
    end 
  end


  def end_game 
    
  end

  private 
 
  def init_players
    print "Please enter player 1 name: "
    player1_name = gets.chop
    print "please enter player 1 type (x or o): "
    player1_type = gets.chop
    
    print "Please enter player 2 name: "
    player2_name = gets.chop
    player2_type = player1_type == "x" ? "o" : "x"
    
    @player1 = Player.new(player1_name, player1_type)
    @player2 = Player.new(player2_name, player2_type)
  end
    
  def init_board()
    # print "Please enter board size: "
    # board_size = gets.chop.to_i

    @board = Board.new
  end

  def win?
    line_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    line_array.each do |line|
      first_ele = @board.getItem(line[0])
      second_ele = @board.getItem(line[1])
      third_ele = @board.getItem(line[2])
      
      return true if first_ele == second_ele && first_ele == third_ele
    end 
    false 
  end
  
end

gm = GameManager.new

gm.start_game
