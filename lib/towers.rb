class TowerError < StandardError
  def message
    "Your move is invalid"
  end
end

class Game
  attr_accessor :board

  def initialize(board=[[5, 4, 3, 2, 1], [], []])
    @board = board
  end

  def won?
    if(board[1].length == 5 || board[2].length == 5)
      true
    else
      false
    end
  end

  def move(start, dest)

    raise TowerError if [start, dest].any?{ |tower| !tower.between?(0,2) }

    disk_to_move = board[start].last
    top_disk = board[dest].last

    if disk_to_move && (top_disk.nil? || disk_to_move < top_disk)
      board[start].pop
      board[dest] << disk_to_move
    else
      raise TowerError
    end

  end

  def render
    print board
    puts
  end

  def play
    until won?
      render
      start, dest = get_guess
      move(start.to_i, dest.to_i)
    end
    rescue TowerError => e
      puts e.message
      retry

    puts "YOU WON!"
  end

  def get_guess
    puts "Enter start and end tower (ex: 1,2)"
    gets.chomp.split(",")
  end


end
