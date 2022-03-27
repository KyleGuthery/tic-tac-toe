keep_playing = true

class Mark
  attr_accessor :mark

  def initialize(mark)
    @mark = mark
    puts "Select square number to play: "
    @choice = gets.chomp.to_i
    self.play(@choice)
  end

  def play(choice)
    if $board[choice] != "X" && $board[choice] != "O"
      $board[choice] = @mark
    else
      $turn -= 1
      p "Space taken. Choose again."
    end
  end
end

def print_board
  puts "#{$board[0]}|#{$board[1]}|#{$board[2]}"
  puts "-+-+-"
  puts "#{$board[3]}|#{$board[4]}|#{$board[5]}"
  puts "-+-+-"
  puts "#{$board[6]}|#{$board[7]}|#{$board[8]}"
end

def win_checker
  if $board[0] == $board[1] && $board[1] == $board[2]||
     $board[3] == $board[4] && $board[4] == $board[5]||
     $board[6] == $board[7] && $board[7] == $board[8]||
     $board[0] == $board[3] && $board[3] == $board[6]||
     $board[1] == $board[4] && $board[4] == $board[7]||
     $board[2] == $board[5] && $board[5] == $board[8]||
     $board[0] == $board[4] && $board[4] == $board[8]||
     $board[2] == $board[4] && $board[4] == $board[6]
          
    if $turn % 2 == 0
      puts "O wins"
      $winner_declared = true
    else
      puts "X wins"
      $winner_declared = true
    end
  end
end

def game
  $winner_declared = false
  $turn = 0

  while !$winner_declared
    $turn +=1
    if $turn %2 ==0
      play = Mark.new("O")
      print_board()
      win_checker()
    else
      play = Mark.new("X")
      print_board()
      win_checker()
    end

    if $turn > 8
      puts "TIE"
      $winner_declared = true
    end
  end
end

while keep_playing == true
  p "Would you like to play Tic-Tac-Toe? (y/n)"

  keep_going = gets.chomp

  if keep_going == "y"
    keep_playing = true
    $board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    print_board()
    game()
  elsif keep_going == "n"
    keep_playing = false
  else
    p "enter y or n"
  end
end