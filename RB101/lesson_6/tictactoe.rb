require 'pry'

FIRST_GO = 'player'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES =   [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # colums
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
SCORE = {'Player' => 0, 'Computer' => 0}

def prompt(msg)
  puts msg
end

def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that's not a valid choice."
    end
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2 && board.values_at(*line).count(INITIAL_MARKER) == 1
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys[0]
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  square = 5 if brd[5] == ' '

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(ary, delimeter = ', ', word = 'or')
  if ary.length > 1
    "#{ary[0..(ary.length - 2)].join(delimeter)} #{word} #{ary.last}"
  else
    ary[0].to_s
  end
end

def computer_defence(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      brd.values_at(*line) == ' '
    end
  end
end

def check_game_score
  if SCORE['Player'] == 5
    prompt "The Player won 5 times!"
    SCORE['Computer'] = 0
    SCORE['Player'] = 0
  elsif SCORE['Computer'] == 5
    prompt "The Computer won 5 times!"
    SCORE['Computer'] = 0
    SCORE['Player'] = 0
  end
end

def place_piece!(board, current_player)
  if current_player == 'computer'
    computer_places_piece!(board)
  else
    player_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

if FIRST_GO == 'choose'
  prompt "Who should go first each round? 1: 'Computer', 2: 'Player'" 
  FIRST_GO = gets.chomp
end

loop do
  board = initialize_board
  current_player = FIRST_GO

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    SCORE[winner] += 1
  else
    prompt "It's a tie!"
  end

  prompt "The score is: Player has #{SCORE['Player']} wins, Computer has #{SCORE['Computer']} wins"

  check_game_score

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
