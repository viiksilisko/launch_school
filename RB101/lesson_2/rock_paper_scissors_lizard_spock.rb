VALID_INPUT_CHOICES = ['(r)ock', '(p)aper', '(sc)issors', '(sp)ock', '(l)izard']

GAME_LOGIC = {
  rock: {
    loses: ['scissors', 'lizard'],
    inputs: ['r', 'rock']
  },
  paper: {
    loses: ['rock', 'spock'],
    inputs: ['p', 'paper']
  },
  scissors: {
    loses: ['paper', 'lizard'],
    inputs: ['sc', 'scissors']
  },
  lizard: {
    loses: ['spock', 'paper'],
    inputs: ['l', 'lizard']
  },
  spock: {
    loses: ['scissors', 'rock'],
    inputs: ['sp', 'spock']
  }
}

def prompt(message)
  puts("=> #{message}")
end

def determine_winner(computer, user)
  GAME_LOGIC[computer.to_sym][:loses].include?(user) ? 'user' : 'computer'
end

def display_results(winner, computer_score, user_score)
  case winner
  when 'computer'
    prompt("The computer won!")
  when 'user'
    prompt("You won!")
  else
    prompt("It's a tie!")
  end

  prompt("The score is: User: #{user_score}, Computer: #{computer_score}")

  if user_score == 5
    prompt("User is the grandmaster and wins the match!")
  elsif computer_score == 5
    prompt("Computer is the grandmaster and wins the match!")
  end
end

def user_choice(input)
  choice = GAME_LOGIC.select { |_, v| v[:inputs].include?(input) }
  choice.any? ? choice.keys : nil
end

computer_score = 0
user_score = 0

loop do
  system('clear')
  choice = ''
  loop do
    prompt("Choose one: #{VALID_INPUT_CHOICES.join(', ')}")
    choice = user_choice(gets.chomp)
    break if choice
    prompt("That's not a valid choice")
  end

  computer_choice = GAME_LOGIC.keys.sample

  round_winner = determine_winner(computer_choice, choice)
  round_winner == 'computer' ? computer_score += 1 : user_score += 1

  prompt("You chose: #{choice}, the Computer chose: #{computer_choice}")

  display_results(round_winner, computer_score, user_score)

  prompt("Do you want to play again? (y)es to continue, any other key to quit")
  answer = gets.chomp.downcase

  if answer == 'y' || answer == 'yes'
    if computer_score == 5 || user_score == 5
      computer_score = 0
      user_score = 0
    end
  else
    break
  end
end
